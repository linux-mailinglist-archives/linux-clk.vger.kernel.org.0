Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DC72203160
	for <lists+linux-clk@lfdr.de>; Mon, 22 Jun 2020 10:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725835AbgFVIGW (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 22 Jun 2020 04:06:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725826AbgFVIGQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Jun 2020 04:06:16 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 462EFC061797
        for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2020 01:06:16 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id s13so12357582otd.7
        for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2020 01:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RCGFWVoC+22vi5fGF/Lzmf9sDoYHuK/JibjQYr3rU/Y=;
        b=RNpzDrmu/1ExMjMNc3/90lZOQTc6y1Ts0qeHUevG26B05m1/F/EMtiDaHXeF8qfsr7
         GKoEFysjLRg6rx9Zx1JSdq7fHG/cCuZJyre4QKxW1VSZ5aF/zw5+9I8ohCiSH94IQWNc
         z0wSthDKVujjSIBEINJWoJlPBNYblC99IVxxx5HDdmk3QS0AXZVlK2JN91MFMeMs/ZYl
         BYwa6zOxzp7ToJ0ny1CbEZgzfbsK6QZ2TVdjSA0CJ0zUFsh6MbyiM8CTTD1jJSFfAZ0x
         uBJpEgb05sarWVdKVLuM+THYvmvCoprm03aRDMwMbEzVczRiUBbXdA7UvnvQYoGUmOV5
         Ls+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RCGFWVoC+22vi5fGF/Lzmf9sDoYHuK/JibjQYr3rU/Y=;
        b=KQMvaBtKKsvnqFu75GtNhsCzMXfAu8l2cbSLTP1MnX5Z6VIy6sdW10YiRf3z/VPMxO
         wjhSw/89Y8+mWQ1e1O7GmjUZfLH/SiJgZzaROjsWJ/NsKtCTsM3odIi1Y2MunfkuzRfL
         iZ/o8yuDVOa8mcYTb7GxxAQX0avidnuxIkwFzKN/4ljiQCK6HQfqw+u3misHOfCEoLuC
         Cr1BS080Xb1bYr3A7rxuuuHzz8mezVNLhdh0FrbhWLbYXCyGYpRnA4XhIhzldSNA0RhY
         bwc1dvOlD3DsRyFTXo5dwSNykctBaoT/17PilVzGra8bo1orl1Fn2QpBWTxupYgBKM60
         zJYQ==
X-Gm-Message-State: AOAM530gj7jL+4l4459PpRbEUeJZTmiQOLXFCHj/rF1gG+ChDBVQSDVq
        0JljMh7CfQnsMMdOzPpMTAGaKQ==
X-Google-Smtp-Source: ABdhPJx3DnAh2tMtG2FaBUndVdH5/vjM9U66Owh7njm0BJFz0Y2FVlFk93FnZDPI61FWL/XHCPvV2Q==
X-Received: by 2002:a9d:7b41:: with SMTP id f1mr13350822oto.363.1592813175637;
        Mon, 22 Jun 2020 01:06:15 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f5sm3239196oou.47.2020.06.22.01.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 01:06:14 -0700 (PDT)
Date:   Mon, 22 Jun 2020 01:03:29 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 2/8] Documentation: Document pm660(l) SPMI GPIOs
 compatible
Message-ID: <20200622080329.GD2421@builder.lan>
References: <20200622075749.21925-1-konradybcio@gmail.com>
 <20200622075749.21925-3-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622075749.21925-3-konradybcio@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon 22 Jun 00:57 PDT 2020, Konrad Dybcio wrote:

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> index 7be5de8d253f..c3d1914381ae 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> @@ -23,6 +23,8 @@ PMIC's from Qualcomm.
>  		    "qcom,pmi8994-gpio"
>  		    "qcom,pmi8998-gpio"
>  		    "qcom,pms405-gpio"
> +		    "qcom,pm660-gpio"
> +		    "qcom,pm660l-gpio"
>  		    "qcom,pm8150-gpio"
>  		    "qcom,pm8150b-gpio"
>  		    "qcom,pm6150-gpio"
> -- 
> 2.27.0
> 
