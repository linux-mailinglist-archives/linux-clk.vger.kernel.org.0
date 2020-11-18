Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 628672B754C
	for <lists+linux-clk@lfdr.de>; Wed, 18 Nov 2020 05:11:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727648AbgKREK4 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 17 Nov 2020 23:10:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727448AbgKREK4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Nov 2020 23:10:56 -0500
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 807BEC061A52
        for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2020 20:10:54 -0800 (PST)
Received: by mail-oo1-xc41.google.com with SMTP id l10so86662oom.6
        for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2020 20:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dRKcQO3pMtpF1NuRSX79Onpwrs+gklZx89qUCct/3SM=;
        b=qx0xDJvKIig0sy53FRoTJcfK5ApCXai9Xep4AiD5uw8cXKVPDQJuiOvTAKPirYWbK6
         9uRC4oqhzurXiQqdPKA9npG9AFTdq5Vivhs2DXfQyNYtVokc+fIB/Y5T55L5n2XLjKWo
         h7JUwS7itLQITyiZRajejWqSlrJLdycOzUtIkvrJJpfZcpp6gqp0c15ew4e0PYxLr2/s
         JFHsfb5BjYhCMMEkUN/hF3VrftxD1WBc8tiw36P6gDNJDDpZBuzo1Ai+DxgcJar4Seba
         1Fh9lslOMthE7PJESN3QIvxQz3MxHsgUhvjrtD3jaAZ/Gclo5uxQtduw5GxJRTrzYGZ6
         aRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dRKcQO3pMtpF1NuRSX79Onpwrs+gklZx89qUCct/3SM=;
        b=JfcKHcdjQ+wunKD3iQ3JEw2XYmIPiXPEbYqpd77MNljNr4HcjHzImZWmPkx684jbkN
         7nb0iBmEwgGwgf2WNd40JCxOysBxuUNMnhWnAlD0WXm3Y0u0QLNGvZI++naTW9jFhwid
         GMgwEz3W7SVfCXW1vGkvBrd4R1Zzlw9qGMTIwnYVtjDEvODWdbaykWE8RquHHQOlx/YM
         aqaEGdqupxMwlZtHGdhOxcK40q9FxQtKXNpD+GBd4NdJkGb0mVcK7C+9Mzu95GwuF1g+
         D+AX6GXcjry/fDAZ1+ij6cYyGBLT8PH/tplSzjpGxxrfU7fUMnfyQ9RYqGFpVhMYNgwk
         Rigw==
X-Gm-Message-State: AOAM531AzeHYwJm/cLXbULF8OxdXTpIaupPEbM++IAa67TUoVgwHOj2t
        /Z5JtCKigDBRLg2TEfpRQDX0yw==
X-Google-Smtp-Source: ABdhPJxl09WdJ1NQZeKYkxqPw0H5GKrDyLUScIS7dsPNwhLOqoUD1AyXq3vCWBh9+EB1kPR4vKnIfA==
X-Received: by 2002:a4a:ddd7:: with SMTP id i23mr5416947oov.73.1605672653737;
        Tue, 17 Nov 2020 20:10:53 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w22sm2446592oie.49.2020.11.17.20.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 20:10:53 -0800 (PST)
Date:   Tue, 17 Nov 2020 22:10:51 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     agross@kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, robh+dt@kernel.org, sboyd@kernel.org,
        mturquette@baylibre.com, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 5/6] dts:qcom:sdm845: Add dt entries to support crypto
 engine.
Message-ID: <20201118041051.GF8532@builder.lan>
References: <20201117134714.3456446-1-thara.gopinath@linaro.org>
 <20201117134714.3456446-6-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201117134714.3456446-6-thara.gopinath@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue 17 Nov 07:47 CST 2020, Thara Gopinath wrote:

> Add crypto engine (CE) and CE BAM related nodes and definitions to
> "sdm845.dtsi".
> 
> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 30 ++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 40e8c11f23ab..b5b2ea97681f 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -2138,6 +2138,36 @@ ufs_mem_phy_lanes: lanes@1d87400 {
>  			};
>  		};
>  
> +		cryptobam: dma@1dc4000 {
> +			compatible = "qcom,bam-v1.7.0";
> +			reg = <0 0x01dc4000 0 0x24000>;
> +			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&rpmhcc RPMH_CE_CLK>;
> +			clock-names = "bam_clk";
> +			#dma-cells = <1>;
> +			qcom,ee = <0>;
> +			qcom,controlled-remotely = <1>;
> +			iommus = <&apps_smmu 0x704 0x1>,
> +				 <&apps_smmu 0x706 0x1>,
> +				 <&apps_smmu 0x714 0x1>,
> +				 <&apps_smmu 0x716 0x1>;

Can you confirm that this can't be written as:

iommus = <&apps_smmu 0x704 0x3>,
	 <&apps_smmu 0x714 0x3>;

(and same below).

Regards,
Bjorn
> +		};
> +
> +		crypto: crypto@1dfa000 {
> +			compatible = "qcom,crypto-v5.4";
> +			reg = <0 0x01dfa000 0 0x6000>;
> +			clocks = <&gcc GCC_CE1_AHB_CLK>,
> +				 <&gcc GCC_CE1_AHB_CLK>,
> +				 <&rpmhcc RPMH_CE_CLK>;
> +			clock-names = "iface", "bus", "core";
> +			dmas = <&cryptobam 6>, <&cryptobam 7>;
> +			dma-names = "rx", "tx";
> +			iommus = <&apps_smmu 0x704 0x1>,
> +				 <&apps_smmu 0x706 0x1>,
> +				 <&apps_smmu 0x714 0x1>,
> +				 <&apps_smmu 0x716 0x1>;
> +		};
> +
>  		ipa: ipa@1e40000 {
>  			compatible = "qcom,sdm845-ipa";
>  
> -- 
> 2.25.1
> 
