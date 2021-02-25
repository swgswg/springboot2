package com.example.common.digest;

/**
 * @author song
 * 加解密接口
 */
public interface DigestInterface {
    /**
     * 加密
     * @param plaintext 明文
     * @return 加密后字符串
     */
    public String encrypt(String plaintext);


    /**
     * 解密
     * @param digest 密文
     * @return 解密后的字符串
     */
    public String decrypt(String digest);


}
