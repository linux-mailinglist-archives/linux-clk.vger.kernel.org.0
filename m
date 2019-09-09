Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D024BADAFE
	for <lists+linux-clk@lfdr.de>; Mon,  9 Sep 2019 16:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731155AbfIIORo (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 9 Sep 2019 10:17:44 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53263 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731052AbfIIORo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Sep 2019 10:17:44 -0400
Received: by mail-wm1-f68.google.com with SMTP id q19so14073593wmc.3
        for <linux-clk@vger.kernel.org>; Mon, 09 Sep 2019 07:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2qb5xUYiQ7B8gJNTYidGOmiStSSf8Mji6z+Cq9akdzo=;
        b=Flbcx2BCt5vaMvdtOI3H+Teqq4mwUXKD+Vl4eF5nM5MnB25gGA7qaHWiUmW4867wb7
         meo/YTmyrqM0PAwLwQFIBsfqCf522XecZkUj5Z3UuZyGYZqIISZWW+WOGmnEDWnow1b7
         HWqpVnNPEdZaqDTudQ+INYo05gBQETKL5j4ibd3js4cA7j3Sw5ll5/cqBtMoYYmnSM8l
         3o3vyibK1sSuOhgSy3pxPnIN2KEqjy+l0e4YU8wA+GL+6P5Xl7GjnhgYZ81Ezh9f+t/E
         svHOSKVSGKWAjz2Ui5K+YbgUbRVo1k1ka6cFmWe9IixwWPVXZnVsba3XdRXgrS6JmdRB
         RoLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2qb5xUYiQ7B8gJNTYidGOmiStSSf8Mji6z+Cq9akdzo=;
        b=ipWoThWFI5RiWAk6tOuiN+Ns8t8A3JRwBsOHxFM5dpN6T6w+TXcKXzMbhKLjyckQY1
         w4B1ranlLmER6dHTQRPxgW/+yjN09E8KMnmCphvJ6dbJmSQMgbmo51fEjCM7CD2mw2ty
         UpgUNAYMOpG8SLT9JVhmvXyIpqCMk2cnrZogGy0SXm1Xn+cNa4Dhf1akFMcumw8Yev7z
         9SbxhEH617QJkTz6h88UY7XV38+4Lln1dP4iVWELOrlBlU3G0ZC6F7cN/X9cL+tZCHiE
         k7fH7aYsxDVOBeANJCycyq3MgV0acHxtKTx7D2DAMrmPeL0K4QMVlx5rn+O9HVJfp2tf
         DOGA==
X-Gm-Message-State: APjAAAVyBK1VQoqYnaZ7xj69SezVJ54lBp06qNoolxiGk0A3MAci9rhN
        8LbbF5acMqQizzvjL5GpUJbhOA==
X-Google-Smtp-Source: APXvYqxDvIFV/NVWVLGmp7FjrlkvLwAO5iOMBuEdJaZBZlUzZur45Ig1Y1u68ulDq2RQcMpTNRH5nQ==
X-Received: by 2002:a7b:cc82:: with SMTP id p2mr18607472wma.165.1568038662629;
        Mon, 09 Sep 2019 07:17:42 -0700 (PDT)
Received: from igloo (69.red-83-35-113.dynamicip.rima-tde.net. [83.35.113.69])
        by smtp.gmail.com with ESMTPSA id d9sm22225290wrc.44.2019.09.09.07.17.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Sep 2019 07:17:41 -0700 (PDT)
From:   "Jorge Ramirez-Ortiz, Linaro" <jorge.ramirez-ortiz@linaro.org>
X-Google-Original-From: "Jorge Ramirez-Ortiz, Linaro" <JorgeRamirez-Ortiz>
Date:   Mon, 9 Sep 2019 16:17:40 +0200
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     agross@kernel.org, jorge.ramirez-ortiz@linaro.org,
        mturquette@baylibre.com, bjorn.andersson@linaro.org,
        niklas.cassel@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] clk: qcom: apcs-msm8916: get parent clock names from
 DT
Message-ID: <20190909141740.GA23964@igloo>
References: <20190826164510.6425-1-jorge.ramirez-ortiz@linaro.org>
 <20190826164510.6425-2-jorge.ramirez-ortiz@linaro.org>
 <20190909102117.245112089F@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190909102117.245112089F@mail.kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/09/19 03:21:16, Stephen Boyd wrote:
> Quoting Jorge Ramirez-Ortiz (2019-08-26 09:45:07)
> > @@ -76,10 +88,11 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
> >         a53cc->src_shift = 8;
> >         a53cc->parent_map = gpll0_a53cc_map;
> >  
> > -       a53cc->pclk = devm_clk_get(parent, NULL);
> > +       a53cc->pclk = of_clk_get(parent->of_node, pll_index);
> 
> Presumably the PLL was always index 0, so why are we changing it to
> index 1 sometimes? Seems unnecessary.
> 

it came as a personal preference. hope it is acceptable (I would
rather not change it)

apcs-msm8916.c declares the following

[..]
static const u32 gpll0_a53cc_map[] = { 4, 5 };
static const char *gpll0_a53cc[] = {
       "gpll0_vote",
	"a53pll",
	};
[..]


now will be doing this

--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -429,7 +429,8 @@
     compatible = "qcom,msm8916-apcs-kpss-global", "syscon";
     reg = <0xb011000 0x1000>;
     #mbox-cells = <1>;
-                   clocks = <&a53pll>;
+                 clocks = <&gcc GPLL0_VOTE>, <&a53pll>;
+                 clock-names = "aux", "pll";
                      #clock-cells = <0>;
               };
														

so I chose to keep the consistency between the clocks definition and
just change the index before calling of_clk_get.




