package com.example.service;


import com.example.exception.work.JwtException;
import io.jsonwebtoken.*;
import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;
import java.util.Date;
import java.util.Map;

@Data
@Component
@ConfigurationProperties(prefix = "jjwt")
public class JwtService {
    /**
     * token 过期时间/毫秒
     */
    private Long expired;
//    private long expired = 2 * 60 * 1000;


    /**
     * jwt 加密解密密钥(可自行填写)
     */
    private String secret;
//    private String secret = "LX2lnm1cyaHUuPHWxb02Txzl5yTx2lqfRthIFrHO+zQ=";

    private static final SignatureAlgorithm ALGORITHM = SignatureAlgorithm.HS256;
    private static final String ISSUER = "com";


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
        builder.setExpiration(new Date(nowMillis + this.expired));

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
                    .setSigningKey(key)
                    .build()
                    .parseClaimsJws(jwt)
                    .getBody();
        } catch (PrematureJwtException e){
            throw new JwtException("该JWT的接收时间还没到");
        } catch (ExpiredJwtException e){
            throw new JwtException("该JWT的已经过期");
        } catch (UnsupportedJwtException e){
            throw new JwtException("不支持该JWT");
        } catch (MalformedJwtException e){
            throw new JwtException("该JWT不正确");
        } catch (IllegalArgumentException e){
            throw new JwtException("无效的JWT");
        } catch (Exception e) {
            throw new JwtException(e.getMessage());
        }
    }

    /**
     * 获取jwt中的值
     * @param jwt
     * @return
     */
    public Map<String, Object> getClaimsByKey(String jwt) {
        return this.decode(jwt);
    }


    /**
     * 获取jwt中的值
     * @param jwt
     * @param key
     * @return
     */
    public Object getClaimsByKey(String jwt, String key) {
        Map<String, Object> claims = this.decode(jwt);
        return claims.get(key);
    }


    /**
     * 生成签名的时候使用的秘钥.
     * 注意：切记这个秘钥不能外露哦。它就是你服务端的私钥，在任何场景都不应该流露出去。一旦客户端得知这个secret, 那就意味着客户端是可以自我签发jwt了。
     */
    private SecretKey generalKey() {
        byte[] encodedKey = Base64.getEncoder().encode(this.secret.getBytes());
        return new SecretKeySpec(encodedKey, 0, encodedKey.length, ALGORITHM.getJcaName());
    }

}