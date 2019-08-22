Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 664BB9A167
	for <lists+linux-clk@lfdr.de>; Thu, 22 Aug 2019 22:49:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388108AbfHVUtR (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 22 Aug 2019 16:49:17 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37863 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388006AbfHVUtQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Aug 2019 16:49:16 -0400
Received: by mail-pl1-f195.google.com with SMTP id bj8so4137575plb.4
        for <linux-clk@vger.kernel.org>; Thu, 22 Aug 2019 13:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=2uDwt6fAK/N9T+CbpSjs6dbH6+5DHIx26WADObuQDzE=;
        b=R0spZTUo/T0PRsg5PI/1uZhfzyWB6wBUIigLkZClyUv1LN/+HmLF6mXGmpeZoYbPDO
         XNasGh5DGwolbDlvS5kfpQ4rGzc+rMW1e1i8ubtXhfsx1cd9d7FOwyyFSanH+176YY/3
         3AqtYnd1U8YtD9/Q77R7ag/EXSbHTPmg1AZVt79+kkMCUow4aP8ZC3Ymx9PhVSREBScc
         usC+F/Y9Zc4Y5/O6p6q1XR9pNkoRwuQI3BvjmLvqXF5dKRCqjWMFD3UjKCHCSzcg5yLG
         wHNGIIQSHVAUjPIgFEoBl4uB79kIo0dOnHBi+UzTa4wJWRF9y1FyKdqP1qvZ/Fx/rMLv
         Pi3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=2uDwt6fAK/N9T+CbpSjs6dbH6+5DHIx26WADObuQDzE=;
        b=ikDA4yo73idspnv+yVzuOtW0ddpFKy/1qeYgqOQ8efXJbM60MKDDWw8s0TVPlXF5bz
         kKJaxEI/bRTe40mhLjaWu/xOBBOcqJoeNv74upnAyGAss+6q4nzxxdbg84QiOk1Pl5mq
         IZpsgLLQ0juTLE0hU/YuVnsOfc2BOfA2TW6ZutAkcR/Ds59MlC9zkCM6QZFD7LMhZ6JD
         vlFeR5Jnorye2wA3Kkahh6bNZbl8iJ/Qsn9KgjSdhnxRyPJ7QYs7U9Hnut+sqrxz7ZWJ
         OEoKNZOVPnOg8RkP4Z3NORaLVyOIqEc4OTjNvqRe75b0qf475xTTg9zzxWBL4L4DfmWy
         tXQw==
X-Gm-Message-State: APjAAAXMQpcH7c+HMNUx4qQqElKk4nvrK0l1CQd1NbiF9LOsPzG7dem3
        putWrzbgJcVaNWJ8lppcHOLo1A==
X-Google-Smtp-Source: APXvYqy+5buHmhq/g7FHVDCldUueTHQk+4S3qVKCiO2juY7sd2p4Bok8Takfe/T/2C2LT7NNhSTX7A==
X-Received: by 2002:a17:902:aa03:: with SMTP id be3mr793758plb.240.1566506955574;
        Thu, 22 Aug 2019 13:49:15 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:89d4:68d1:fc04:721])
        by smtp.gmail.com with ESMTPSA id 65sm317927pff.148.2019.08.22.13.49.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Aug 2019 13:49:15 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: meson-sm1-sei610: enable DVFS
In-Reply-To: <20190822142455.12506-7-narmstrong@baylibre.com>
References: <20190822142455.12506-1-narmstrong@baylibre.com> <20190822142455.12506-7-narmstrong@baylibre.com>
Date:   Thu, 22 Aug 2019 13:49:14 -0700
Message-ID: <7hpnkx2aet.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> This enables DVFS for the Amlogic SM1 based SEI610 board by:
> - Adding the SM1 SoC OPPs taken from the vendor tree
> - Selecting the SM1 Clock controller instead of the G12A one
> - Adding the CPU rail regulator, PWM and OPPs for each CPU nodes.
>
> Each power supply can achieve 0.69V to 1.05V using a single PWM
> output clocked at 666KHz with an inverse duty-cycle.
>
> DVFS has been tested by running the arm64 cpuburn at [1] and cycling
> between all the possible cpufreq translations of each cluster and
> checking the final frequency using the clock-measurer, script at [2].
>
> [1] https://github.com/ssvb/cpuburn-arm/blob/master/cpuburn-a53.S
> [2] https://gist.github.com/superna9999/d4de964dbc0f84b7d527e1df2ddea25f
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>

Tested on meson-sm1-sei610 board using the userspace govenor to manually
walk through the available frequencies.

I'll queue this up when there's a stable clock tag I can use for patch
5/6.

Kevin

> ---
>  .../boot/dts/amlogic/meson-sm1-sei610.dts     | 59 ++++++++++++++--
>  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    | 69 +++++++++++++++++++
>  2 files changed, 124 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
> index 36ac2e4b970d..69966e2e0611 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
> @@ -19,10 +19,6 @@
>  		ethernet0 = &ethmac;
>  	};
>  
> -	chosen {
> -		stdout-path = "serial0:115200n8";
> -	};
> -
>  	emmc_pwrseq: emmc-pwrseq {
>  		compatible = "mmc-pwrseq-emmc";
>  		reset-gpios = <&gpio BOOT_12 GPIO_ACTIVE_LOW>;
> @@ -136,6 +132,25 @@
>  		regulator-always-on;
>  	};
>  
> +	vddcpu: regulator-vddcpu {
> +		/*
> +		 * SY8120B1ABC DC/DC Regulator.
> +		 */
> +		compatible = "pwm-regulator";
> +
> +		regulator-name = "VDDCPU";
> +		regulator-min-microvolt = <690000>;
> +		regulator-max-microvolt = <1050000>;
> +
> +		vin-supply = <&dc_in>;
> +
> +		pwms = <&pwm_AO_cd 1 1500 0>;
> +		pwm-dutycycle-range = <100 0>;
> +
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
>  	vddio_ao1v8: regulator-vddio_ao1v8 {
>  		compatible = "regulator-fixed";
>  		regulator-name = "VDDIO_AO1V8";
> @@ -182,6 +197,34 @@
>  	hdmi-phandle = <&hdmi_tx>;
>  };
>  
> +&cpu0 {
> +	cpu-supply = <&vddcpu>;
> +	operating-points-v2 = <&cpu_opp_table>;
> +	clocks = <&clkc CLKID_CPU_CLK>;
> +	clock-latency = <50000>;
> +};
> +
> +&cpu1 {
> +	cpu-supply = <&vddcpu>;
> +	operating-points-v2 = <&cpu_opp_table>;
> +	clocks = <&clkc CLKID_CPU1_CLK>;
> +	clock-latency = <50000>;
> +};
> +
> +&cpu2 {
> +	cpu-supply = <&vddcpu>;
> +	operating-points-v2 = <&cpu_opp_table>;
> +	clocks = <&clkc CLKID_CPU2_CLK>;
> +	clock-latency = <50000>;
> +};
> +
> +&cpu3 {
> +	cpu-supply = <&vddcpu>;
> +	operating-points-v2 = <&cpu_opp_table>;
> +	clocks = <&clkc CLKID_CPU3_CLK>;
> +	clock-latency = <50000>;
> +};
> +
>  &ethmac {
>  	status = "okay";
>  	phy-handle = <&internal_ephy>;
> @@ -220,6 +263,14 @@
>  	clock-names = "clkin0";
>  };
>  
> +&pwm_AO_cd {
> +	pinctrl-0 = <&pwm_ao_d_e_pins>;
> +	pinctrl-names = "default";
> +	clocks = <&xtal>;
> +	clock-names = "clkin1";
> +	status = "okay";
> +};
> +
>  &pwm_ef {
>  	status = "okay";
>  	pinctrl-0 = <&pwm_e_pins>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> index 37064d7f66c1..2b61406b0610 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> @@ -50,6 +50,71 @@
>  			compatible = "cache";
>  		};
>  	};
> +
> +	cpu_opp_table: opp-table {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp-100000000 {
> +			opp-hz = /bits/ 64 <100000000>;
> +			opp-microvolt = <730000>;
> +		};
> +
> +		opp-250000000 {
> +			opp-hz = /bits/ 64 <250000000>;
> +			opp-microvolt = <730000>;
> +		};
> +
> +		opp-500000000 {
> +			opp-hz = /bits/ 64 <500000000>;
> +			opp-microvolt = <730000>;
> +		};
> +
> +		opp-667000000 {
> +			opp-hz = /bits/ 64 <666666666>;
> +			opp-microvolt = <750000>;
> +		};
> +
> +		opp-1000000000 {
> +			opp-hz = /bits/ 64 <1000000000>;
> +			opp-microvolt = <770000>;
> +		};
> +
> +		opp-1200000000 {
> +			opp-hz = /bits/ 64 <1200000000>;
> +			opp-microvolt = <780000>;
> +		};
> +
> +		opp-1404000000 {
> +			opp-hz = /bits/ 64 <1404000000>;
> +			opp-microvolt = <790000>;
> +		};
> +
> +		opp-1512000000 {
> +			opp-hz = /bits/ 64 <1500000000>;
> +			opp-microvolt = <800000>;
> +		};
> +
> +		opp-1608000000 {
> +			opp-hz = /bits/ 64 <1608000000>;
> +			opp-microvolt = <810000>;
> +		};
> +
> +		opp-1704000000 {
> +			opp-hz = /bits/ 64 <1704000000>;
> +			opp-microvolt = <850000>;
> +		};
> +
> +		opp-1800000000 {
> +			opp-hz = /bits/ 64 <1800000000>;
> +			opp-microvolt = <900000>;
> +		};
> +
> +		opp-1908000000 {
> +			opp-hz = /bits/ 64 <1908000000>;
> +			opp-microvolt = <950000>;
> +		};
> +	};
>  };
>  
>  &cecb_AO {
> @@ -60,6 +125,10 @@
>  	compatible = "amlogic,meson-sm1-clk-measure";
>  };
>  
> +&clkc {
> +	compatible = "amlogic,sm1-clkc";
> +};
> +
>  &ethmac {
>  	power-domains = <&pwrc PWRC_SM1_ETH_ID>;
>  };
> -- 
> 2.22.0
