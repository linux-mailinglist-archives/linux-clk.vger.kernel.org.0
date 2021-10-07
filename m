Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C997D4256F9
	for <lists+linux-clk@lfdr.de>; Thu,  7 Oct 2021 17:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241749AbhJGPsU (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 7 Oct 2021 11:48:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241642AbhJGPsQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Oct 2021 11:48:16 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65E88C061746
        for <linux-clk@vger.kernel.org>; Thu,  7 Oct 2021 08:46:22 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id v10so9507810oic.12
        for <linux-clk@vger.kernel.org>; Thu, 07 Oct 2021 08:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kjtYykHRfu3oN6LXYJsRLSWIj815s4nhh1Muy8N60sQ=;
        b=R45UfSQ+bdE2Lt+bNuC/oJ0r+7Gm/HotFGaEEwCZFjEckLGqCmSFMFsjdHztQRIYLb
         8s8E6tSjyNPW+RyLroTsdWcH6fZhgGzM4xbAMmcdjxX/7+8iFWkN1X6mAscYYVTwitaC
         63Q80xUR5epHZCDW9iEb6UKkd4zNLr2Q9dtvAS0BtYcnCkszQ6Yx1iZO+mYf28UwmszR
         xdGv62q0OKWIdOszgup8QDJaymbosGpLvpudkt3OBcBv8JgGSAbogNWVFwjuU8mqQBa6
         LLRYNO8XxSU0Ztoe85f/VtN42HYhhN+rsHgu3PeJr/EcfnRNSkz+QZZd3siZ3gDLm76A
         6zig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kjtYykHRfu3oN6LXYJsRLSWIj815s4nhh1Muy8N60sQ=;
        b=VH/xXFuo7VrUZPkTW+MR2XuE5amDUi78r+KU0JEtHjr4t0k7pplT89FgjTPDf92/TO
         zOuhoIA2Lmqe5ns7az+0aVMRAf+RLlvURn3NtI6poK5Bjm2EUaa1pTh4jIj2xFP9K7bj
         NY8i53kDeQUB+GSyu1ualU8fNq40pJwTeT88owOn2492X1SrcYMov7fhR6knI0bgwWPc
         7fEDzoKi0KKcQ5PMchZK0to3yWPRo9/OnJoN1NbLMLMQ0i2vLnFJkvlWgBOah76imKQ3
         yCKqaTOW4IIsFFvuQt+gTkUkjPAAG5bUjg3sbDaEsE8aHDkwkJwgcUDZufZxQuRK0qxz
         +kVQ==
X-Gm-Message-State: AOAM532B3eCL9AxWkdtU+SEx2e6xqj58Hy+IJ31exSxUdtzRCTOpM8pY
        I6dZT8KIyzYfDdMecO3Ba6h3hA==
X-Google-Smtp-Source: ABdhPJyb0r7BkApnwD6ZTwsdS6wSJDTlROhQ2XReuZb9Hhs6nHxCYwNvx87/aJx3BBzNBiCYkKJqDw==
X-Received: by 2002:aca:3656:: with SMTP id d83mr12288367oia.176.1633621581738;
        Thu, 07 Oct 2021 08:46:21 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id bj33sm5120916oib.31.2021.10.07.08.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 08:46:21 -0700 (PDT)
Date:   Thu, 7 Oct 2021 08:48:01 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 7/8] clk: qcom: dispcc-sm8250: stop using mmcx
 regulator
Message-ID: <YV8WsQb9H7+CaLjP@ripper>
References: <20210829154757.784699-1-dmitry.baryshkov@linaro.org>
 <20210829154757.784699-8-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210829154757.784699-8-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun 29 Aug 08:47 PDT 2021, Dmitry Baryshkov wrote:

> Now as the common qcom clock controller code has been taught about power
> domains, stop mentioning mmcx supply as a way to power up the clock
> controller's gdsc.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Once we merge these, I expect that the boards will start crashing if
the kernel is booted using an existing DTB?

Is it okay to just merge the first 6 patches in the series now and
postpone these two until we've had the dts change sitting for a while?

Regards,
Bjorn

> ---
>  drivers/clk/qcom/dispcc-sm8250.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
> index 108dd1249b6a..cf0bb12eb6e1 100644
> --- a/drivers/clk/qcom/dispcc-sm8250.c
> +++ b/drivers/clk/qcom/dispcc-sm8250.c
> @@ -1129,7 +1129,6 @@ static struct gdsc mdss_gdsc = {
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
>  	.flags = HW_CTRL,
> -	.supply = "mmcx",
>  };
>  
>  static struct clk_regmap *disp_cc_sm8250_clocks[] = {
> -- 
> 2.33.0
> 
