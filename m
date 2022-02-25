Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C28644C3F00
	for <lists+linux-clk@lfdr.de>; Fri, 25 Feb 2022 08:27:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238122AbiBYH1j (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 25 Feb 2022 02:27:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238100AbiBYH1i (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Feb 2022 02:27:38 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4553CEFF82
        for <linux-clk@vger.kernel.org>; Thu, 24 Feb 2022 23:27:06 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id 12so3939928pgd.0
        for <linux-clk@vger.kernel.org>; Thu, 24 Feb 2022 23:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/EJDPZRyJrLUyYjmcHsD92/llft00F0XDI+OboyiE0k=;
        b=A/DIi8DryiplGseepJFYonOSdU+a9rytJ1hnRk6LHHKWgxNXAk4+7qhUn69/dVlCWj
         pIta1sp6sFd7PbLKRcxzfAcVyBM5IBI4vNrRtkzuzXtqpzwFMHbQxBR3YH/Et5Q0oiuS
         RXrGnnZw4+Otl9W0BpdWQkAI1JspNdcAvvYTeCsdPjQPVw2d4+T8xqE+zOd7AEfp9O8/
         P9Gv/7Qe0CMjLGpToawSBaZUgCQ9Oa9fQgK/d3jSaQ0WR4GMCyZlsWPTZWBIIJKjnX6n
         n8cMCJ9V/fTzoPqsPGu5EHb7dyCygFus23R7xJeEA28rFVwFeggGsOkdDDrgIrhSvDco
         OSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/EJDPZRyJrLUyYjmcHsD92/llft00F0XDI+OboyiE0k=;
        b=hgabKW1mE4u8ec0+KrnvVW5Q99gEQ36E8W0Y/lPnY4PXpw93UJD1679jfBBrkqY64H
         3dh4SmjRaw5WmtaYxtU5b6OTPUkyWLEJhS3ReHEo8Yyl+VUntThQBad/WYF0t3bNlTef
         S1ESkDnXLurLWrYTxVuhy+mou+YQrn0H+YzVrkp5hQJabg6mknqMvxk7Beww1ff3mopk
         WXxTiFuVjLJ3qWdvkwpohl4Cx42zm580l4kquDqas0snOyL2S0Be6iB2FXIjsIoeUbSB
         Qpx1m+DIeykvaxo81+fxKSQjChyk87C1nsOPmNTBXbXdPDehZGhOl5t/lO7hOkVsuTKg
         LbQg==
X-Gm-Message-State: AOAM531DAj0/p6sjzyiKfaA6/Oaxc+mCXJzmOHOlAUmlch4XeMT3qwcr
        dTujGAPT9KGvsRH1k6EPIE8W
X-Google-Smtp-Source: ABdhPJxvLSiLEaYc56xVY4d/jDRBFxFxauVrOYn64Ab3+ev1wXxI5whdwbWwxrhNCmmzfwTrldviIA==
X-Received: by 2002:a62:3085:0:b0:4e0:1218:6d03 with SMTP id w127-20020a623085000000b004e012186d03mr6378679pfw.19.1645774025767;
        Thu, 24 Feb 2022 23:27:05 -0800 (PST)
Received: from thinkpad ([220.158.159.240])
        by smtp.gmail.com with ESMTPSA id z16-20020a056a00241000b004f3a647ae89sm1883328pfh.174.2022.02.24.23.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 23:27:05 -0800 (PST)
Date:   Fri, 25 Feb 2022 12:56:59 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/5] ARM: dts: qcom: sdx65: Add support for APCS block
Message-ID: <20220225072659.GD274289@thinkpad>
References: <1645505785-2271-1-git-send-email-quic_rohiagar@quicinc.com>
 <1645505785-2271-5-git-send-email-quic_rohiagar@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1645505785-2271-5-git-send-email-quic_rohiagar@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Feb 22, 2022 at 10:26:24AM +0530, Rohit Agarwal wrote:
> The APCS block on SDX65 acts as a mailbox controller and also provides
> clock output for the Cortex A7 CPU.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  arch/arm/boot/dts/qcom-sdx65.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-sdx65.dtsi b/arch/arm/boot/dts/qcom-sdx65.dtsi
> index ec80266..af7453a 100644
> --- a/arch/arm/boot/dts/qcom-sdx65.dtsi
> +++ b/arch/arm/boot/dts/qcom-sdx65.dtsi
> @@ -133,6 +133,15 @@
>  			#clock-cells = <0>;
>  		};
>  
> +		apcs: mailbox@17810000 {
> +			compatible = "qcom,sdx55-apcs-gcc", "syscon";
> +			reg = <0x17810000 0x2000>;
> +			#mbox-cells = <1>;
> +			clocks = <&rpmhcc RPMH_CXO_CLK>, <&a7pll>, <&gcc GPLL0>;
> +			clock-names = "ref", "pll", "aux";
> +			#clock-cells = <0>;
> +		};
> +
>  		timer@17820000 {
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> -- 
> 2.7.4
> 
