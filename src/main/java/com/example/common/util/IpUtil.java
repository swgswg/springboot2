package com.example.common.util;

import org.aspectj.apache.bcel.classfile.Unknown;

import javax.servlet.http.HttpServletRequest;
import java.net.InetAddress;
import java.net.UnknownHostException;

/**
 * IP地址工具类
 * @author song
 */
public class IpUtil {
	private static final String UNKNOWN = "unknown";
	
	/**
	 * 获取发送请求的客户端IP地址（防止代）
	 * @param request 当前请求 
	 * @return String 返回当前请求的客户端IP地址
	 */
	public static String getClientIpAddr(HttpServletRequest request) {
		String ip = null;

		//X-Forwarded-For：Squid 服务代理
		String ipAddresses = request.getHeader("X-Forwarded-For");

		if (ipAddresses == null || ipAddresses.length() == 0 || UNKNOWN.equalsIgnoreCase(ipAddresses)) {
			//Proxy-Client-IP：apache 服务代理
			ipAddresses = request.getHeader("Proxy-Client-IP");
		}

		if (ipAddresses == null || ipAddresses.length() == 0 || UNKNOWN.equalsIgnoreCase(ipAddresses)) {
			//WL-Proxy-Client-IP：weblogic 服务代理
			ipAddresses = request.getHeader("WL-Proxy-Client-IP");
		}

		if (ipAddresses == null || ipAddresses.length() == 0 || UNKNOWN.equalsIgnoreCase(ipAddresses)) {
			//HTTP_CLIENT_IP：有些代理服务器
			ipAddresses = request.getHeader("HTTP_CLIENT_IP");
		}

		if (ipAddresses == null || ipAddresses.length() == 0 || UNKNOWN.equalsIgnoreCase(ipAddresses)) {
			//X-Real-IP：nginx服务代理
			ipAddresses = request.getHeader("X-Real-IP");
		}

		//有些网络通过多层代理，那么获取到的ip就会有多个，一般都是通过逗号（,）分割开来，并且第一个ip为客户端的真实IP
		if (ipAddresses != null && ipAddresses.length() != 0) {
			ip = ipAddresses.split(",")[0];
		}

		//还是不能获取到，最后再通过request.getRemoteAddr();获取
		if (ip == null || ip.length() == 0 || UNKNOWN.equalsIgnoreCase(ipAddresses)) {
			ip = request.getRemoteAddr();
		}

		return ip;
	}
	
	/**
	 * 获取本地服务器的IP地址
	 * @Title: getServerIpAddr 
	 * @Description: 获取服务端的IP地址
	 * @param request 当前请求
	 * @return String 返回当前应用服务器IP地址
	 */
	public static String getServerIpAddr(HttpServletRequest request) {
		return request.getLocalAddr();
	}

	/**
	 * 获取机器hostname
	 * @return
	 * @throws UnknownHostException
     */
	public static String getHostname() throws UnknownHostException {
		InetAddress id = InetAddress.getLocalHost();
		return id.getHostName();
	}
}
