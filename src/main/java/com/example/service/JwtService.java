package com.example.service;


import com.example.exception.work.JwtException;
import io.jsonwebtoken.*;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.io.Encoders;
import io.jsonwebtoken.security.Keys;
import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.security.Key;
import java.util.Date;
import java.util.Map;

/**
 * @author song
 */
@Data
@ConfigurationProperties(prefix = "jjwt")
@Component
public class JwtService {
    /**
     * token 过期时间/毫秒
     */
    private Long expired;


    /**
     * jwt 加密解密密钥(可自行填写)
     */
    private String secret;

    private static final SignatureAlgorithm ALGORITHM = SignatureAlgorithm.HS256;
    private static final String ISSUER = "com";

    public Long getExpired() {
        return this.expired * 1000;
    }

    /**
     * 创建JWT
     */
    public String encode(Map<String,?> claims) {
        Date now = new Date(System.currentTimeMillis());

        //生成JWT的时间
        long nowMillis = System.currentTimeMillis();


        JwtBuilder builder = Jwts.builder();

        if(claims != null && !claims.isEmpty()){
            // 如果有私有声明，一定要先设置，因为一旦写在标准的声明赋值之后，就是覆盖了那些标准的声明
            // 如果claims存在id, sub, aud会覆盖
            builder.setClaims(claims);
        }

        //iss:jwt签发人
        builder.setIssuer(ISSUER);

        //设置过期时间
        builder.setExpiration(new Date(nowMillis + this.getExpired()));

        //nbf:jwt生效时间
        builder.setNotBefore(now);

        //iat:jwt的签发时间
        builder.setIssuedAt(now);

        // 设置签名使用的签名算法和签名使用的秘钥
        builder.signWith(this.generalKey(), ALGORITHM);

        //生成jwt数据
        return builder.compact();
    }


    /**
     * 解析JWT字符串
     * @param jwt
     * @return Claims claims
     * @exception JwtException
     */
    public Map<String, Object> decode(String jwt) {
        if (jwt == null) {
            throw new JwtException("令牌不合法2");
        }

        try {
            //签名秘钥，和生成的签名的秘钥一模一样
            SecretKey key = this.generalKey();
            return Jwts.parserBuilder()
                    // 解析 JWT 的服务器与创建 JWT 的服务器的时钟不一定完全同步，此设置允许两台服务器最多有 3 分钟的时差
                    .setAllowedClockSkewSeconds(180L)
                    .setSigningKey(key)
                    .build()
                    .parseClaimsJws(jwt)
                    .getBody();
        } catch (PrematureJwtException e){
            throw new JwtException("令牌接收时间还没到");
        } catch (ExpiredJwtException e){
            throw new JwtException("令牌的已经过期");
        } catch (UnsupportedJwtException e){
            throw new JwtException("不支持该令牌");
        } catch (MalformedJwtException e){
            throw new JwtException("令牌不正确");
        } catch (IllegalArgumentException e){
            throw new JwtException("无效的令牌");
        } catch (Exception e) {
            throw new JwtException();
        }
    }

    /**
     * 获取jwt中的值
     * @param jwt
     * @return
     */
    public Map<String, Object> getClaims(String jwt) {
        return this.decode(jwt);
    }


    /**
     * 获取jwt中的值
     * @param jwt
     * @param key
     * @return
     */
    public Object getClaimsByKey(String jwt, String key) {
        Map<String, Object> claims = this.getClaims(jwt);
        return claims.get(key);
    }


    /**
     * 生成签名的时候使用的秘钥.
     * 注意：切记这个秘钥不能外露哦。它就是你服务端的私钥，在任何场景都不应该流露出去。一旦客户端得知这个secret, 那就意味着客户端是可以自我签发jwt了。
     */
    private SecretKey generalKey() {
        byte[] encodedKey =  Decoders.BASE64.decode(this.getSecret());
        return new SecretKeySpec(encodedKey, 0, encodedKey.length, ALGORITHM.getJcaName());
    }


    /**
     * 获取新的秘钥
     * @return
     */
    public static String getNewSecret() {
        Key key = Keys.secretKeyFor(ALGORITHM);
        return Encoders.BASE64.encode(key.getEncoded());
    }

}