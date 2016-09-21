package com.iWen.survey.util;

public class IPUtils {
	 public static int[] IPsplit(String ip) {
	        return IPsplit(ip,false);
	    }

	    public static int[] IPsplit(String ip,boolean max) {
	        int[] inum = new int[4];
	        try {
	            String[] nums = ip.split("[.]");
	            int len =nums.length;
	            for (int i = 0; i < len; i++) {
	                inum[i] = Integer.parseInt(nums[i]);
	            }
	            if(max) {//if max ,fill 256 to int[]
	                if(len<inum.length) {
	                    for (int j = len; j < inum.length; j++) {
	                        inum[j]=256;
	                    }
	                }
	            }
	        } catch (Exception e) {
	        }
	        return inum;
	    }
	    public static boolean isBetween(String myIP, String ip) {
	        return isBetween(myIP, ip, ip);
	    }

	    public static boolean isBetween(String myIP, String ip1, String ip2) {
	        if (myIP == null) {
	            return true;
	        }
	        if (null == ip1) {
	            ip1 = "0.0.0.0";
	        }
	        if (null == ip2) {
	            ip2 = "256.0.0.0";
	        }
	        int[] myIPs = IPsplit(myIP);

	        return arraySub(myIPs, IPsplit(ip2,true)) && arraySub(IPsplit(ip1), myIPs);
	    }

	    private static boolean arraySub(int[] a, int[] b) {
	        for (int i = 0; i < a.length; i++) {
	            if (b[i] - a[i] > 0) {
	                return true;
	            } else if (b[i] - a[i] < 0) {
	                return false;
	            } else {
	                if(i+1==a.length) {//check is end
	                    return true;
	                }else {
	                    continue;
	                }
	            }
	        }
	        return false;
	    }

	    public static void main(String[] args) {
	        String myIP = "61.52.31.64";
	        String ip1 = "61.52.31.68";
	        String ip2 = "61.52.31";
	        System.out.println(isBetween(myIP, ip1,ip2));
	        System.out.println(isBetween(myIP, ip1));

	    }

	}


