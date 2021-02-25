package com.example.common.digest;

import java.util.Base64;

/**
 * Base64加解密
 * @author song
 */
public class Base64Digest implements DigestInterface {
    public static void main(String[] args) {
        Base64Digest base64Digest = new Base64Digest();
        System.out.println(base64Digest.encrypt("123456"));
        System.out.println(base64Digest.decrypt("MTIzNDU2"));
    }

    /**
     * 加密
     *
     * @param plaintext 明文
     * @return 加密后字符串
     */
    @Override
    public String encrypt(String plaintext) {
        try {
            return Base64.getEncoder().encodeToString(plaintext.getBytes("UTF-8"));
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    /**
     * 解密
     *
     * @param digest 密文
     * @return 解密后的字符串
     */
    @Override
    public String decrypt(String digest) {
        return new String(Base64.getDecoder().decode(digest));
    }
}
