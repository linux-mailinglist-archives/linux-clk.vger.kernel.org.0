Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EACDB3C2958
	for <lists+linux-clk@lfdr.de>; Fri,  9 Jul 2021 20:55:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbhGIS6m (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 9 Jul 2021 14:58:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230352AbhGIS6l (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Jul 2021 14:58:41 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FE6AC0613DD
        for <linux-clk@vger.kernel.org>; Fri,  9 Jul 2021 11:55:57 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id z3so12526243oib.9
        for <linux-clk@vger.kernel.org>; Fri, 09 Jul 2021 11:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hDBMTWvuC3NQG5GYyuFOUvgk3Gz5Q3JKQ7xIBH164Hw=;
        b=t1wNfWAFzRd/LSvge8BEkwspf8qC363RNnNsyettGKyvBMAqU1MJjVB/SZJ+tNKHZe
         wy5tu4W0u/64kNhoZlmftQnwEsTJqBM4qGQErzjEqsbDb3Oy9684poAnGFMjrn8RbtZy
         b1SphMXcZseC94XW5R5aY6Pbungjf+g2aiKvMinnhNBkMvMGe5ADt1UIVkObdNSazUOQ
         P1VpmsB5WC2t+6IO96DD3WwZusruNr8gHt2rmjqNhqdMNmORl61q7MowQ5vm6Mm5uIsd
         E78o0qS7E8zyB90htaDuo+1U8qwi93H6NdHBc/1NaJyy9X0U+dqy063MsUid49MPxdud
         qujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hDBMTWvuC3NQG5GYyuFOUvgk3Gz5Q3JKQ7xIBH164Hw=;
        b=TG02iuj9/lGXb7+Jl6jZrxpfpkddScnR0vkSfV06lbNrBQOhs7HZSHqYj/3UFpslA8
         Y2GqqxPhbgCem81dbKI7IRSy7c9jNv9Woe/uaR0UBosHquwk6AAfQPWxrkZuqMnl7iJt
         F7Zs0eANx4uIxySBjrWQtZrPHTaJfTKKvkoAsqUL9/MZ/AGhRbQqsx3wLhktTTl2aVLk
         wJrZhxYhF7/DVQnSClp57pgYgwiIXcW4KmR7c5TmRTE/LSaBrXAQn9PYZ5Frr5+II2f1
         zfwQl/Bw6KRSfg3KFyVgTxP8WxjQBhIAKPSPoL0qkf2ukapf8yYoeJKWmshCN529/ZUL
         sfCA==
X-Gm-Message-State: AOAM5313GdvgYdJIi+LoQkx5pFLDXoduK/unX/ShGTkkZ5FpqxTc9ewh
        Sgjv9F9yfYUZssli1Wgi+ccp5Q==
X-Google-Smtp-Source: ABdhPJwrdBkHKexQcA3MQDWTIUSN2qrz67mZEfXPOjoXn6nd5cGx4JU64z0rcGqP6Ik74wZQEtnGDA==
X-Received: by 2002:aca:3d8a:: with SMTP id k132mr335865oia.120.1625856956740;
        Fri, 09 Jul 2021 11:55:56 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o63sm1403486oih.32.2021.07.09.11.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 11:55:56 -0700 (PDT)
Date:   Fri, 9 Jul 2021 13:55:54 -0500
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
Subject: Re: [PATCH v3 7/7] clk: qcom: videocc-sm8250: stop using mmcx
 regulator
Message-ID: <YOiburkKfepnS9TX@yoga>
References: <20210709173202.667820-1-dmitry.baryshkov@linaro.org>
 <20210709173202.667820-8-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210709173202.667820-8-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri 09 Jul 12:32 CDT 2021, Dmitry Baryshkov wrote:

> Now as the common qcom clock controller code has been taught about power
> domains, stop mentioning mmcx supply as a way to power up the clock
> controller's gdscs.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/clk/qcom/videocc-sm8250.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
> index 7b435a1c2c4b..eedef85d90e5 100644
> --- a/drivers/clk/qcom/videocc-sm8250.c
> +++ b/drivers/clk/qcom/videocc-sm8250.c
> @@ -276,7 +276,6 @@ static struct gdsc mvs0c_gdsc = {
>  	},
>  	.flags = 0,
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.supply = "mmcx",
>  };
>  
>  static struct gdsc mvs1c_gdsc = {
> @@ -286,7 +285,6 @@ static struct gdsc mvs1c_gdsc = {
>  	},
>  	.flags = 0,
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.supply = "mmcx",
>  };
>  
>  static struct gdsc mvs0_gdsc = {
> @@ -296,7 +294,6 @@ static struct gdsc mvs0_gdsc = {
>  	},
>  	.flags = HW_CTRL,
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.supply = "mmcx",
>  };
>  
>  static struct gdsc mvs1_gdsc = {
> @@ -306,7 +303,6 @@ static struct gdsc mvs1_gdsc = {
>  	},
>  	.flags = HW_CTRL,
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.supply = "mmcx",
>  };
>  
>  static struct clk_regmap *video_cc_sm8250_clocks[] = {
> -- 
> 2.30.2
> 
