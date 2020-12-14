package com.lti.test;

public class LoanCalculator {

	private static double calculate(String prcpl, String irate, String tanure) {
		double principal = Double.valueOf(prcpl);      
        double rate = Double.valueOf(irate);
        double time = Double.valueOf(tanure);
        rate=rate/(12*100); 
        time=time*12; 
        return (principal*rate*Math.pow(1+rate,time))/(Math.pow(1+rate,time)-1);
	}
	
	public static void main(String[] args) {
	
		System.out.println("Loan Calculation Start");
		System.out.println("Loan Amount ::> "+args[1]);
		System.out.println("Loan Interest Rate ::> "+args[0]);
		System.out.println("Loan Tenure ::> "+args[1]);
		System.out.println("Loan EMI ::> "+calculate(args[0], args[1], args[2]));
		System.out.println("Loan Calculation End");
	}
}
