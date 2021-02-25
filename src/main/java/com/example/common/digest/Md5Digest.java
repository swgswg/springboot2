package com.example.common.digest;

import cn.hutool.crypto.SecureUtil;


/**
 * MD5加密
 * @author song
 */
public class Md5Digest implements DigestInterface {
    public static String md5(String plaintext) {
        return (new Md5Digest()).encrypt(plaintext);
    }

    /**
     * 加密
     * @param plaintext 明文
     * @return 加密后字符串
     */
    @Override
    public String encrypt(String plaintext) {
        try {
            return SecureUtil.md5("123456");
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
        return null;
    }
}
