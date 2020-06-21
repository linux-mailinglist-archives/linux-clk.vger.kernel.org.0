Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31512202915
	for <lists+linux-clk@lfdr.de>; Sun, 21 Jun 2020 08:08:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729339AbgFUGIJ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 21 Jun 2020 02:08:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbgFUGIJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 21 Jun 2020 02:08:09 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B71D6C061794
        for <linux-clk@vger.kernel.org>; Sat, 20 Jun 2020 23:08:07 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id 35so6064639ple.0
        for <linux-clk@vger.kernel.org>; Sat, 20 Jun 2020 23:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=a+NZmNa85rn9+KPzd4vANmtBgY1PrDp2O3PiIlzp/9U=;
        b=eI396BnBH0g9oNApINxy4c96cZa+zZqLRZLKqxwpBTblF3nx8HJYtA2DhrAFt2lsGl
         nsPxyZUBvcdS3x1dPG+5Bs6J55PX1VcrkPee/0B/cJZn+9Uim19jDcDSK2l51OdA31gG
         BGg3D0rmMeSk219JidiohAbx8ozUcmsPS8XIQQVqzfX6ilNoWiNUdQz9n3DZXZhiTEsY
         DqSY487fcfwKsm5bEpNrSpmKWCNW3/l13lGKFBRRTVl/+RNIN6bvHQFH5ol3tuqqXxma
         bIBL30uXj4bpdquI0nfYhgdqE7r2JUsM7WXDVr3Kb2lI0S25AuzCwq57z9mnyJMMvJRw
         TkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=a+NZmNa85rn9+KPzd4vANmtBgY1PrDp2O3PiIlzp/9U=;
        b=Loy4/FCgkAskslUR5x5ssr4AY4FbOYjxP57dPpnKiYDapxE0OHLM22IP81JW6kAC8D
         EYSrAJJ4k35jyZYTcug8Av/7WCUL3BN3xWXiK64zZEUM6uU1Xfq8NjMt4rMkogHAs13z
         zaycXZXCTskD+P2FgcMgIET0e+D+HZF4Sn1nos7kzVMG4W6K7qlEEEq2Xmu5W4uHU1Pb
         eHwL6O2HF9prsFrFy+2EfGExGUJaCOxvewKB/buh86MG0tFyNdWNLDoEAHsZSuHGtBXy
         ab2ckLj2g9l09iBsJqojWoiXMkGWfmePPw0P4ZtroNGC5yJTKw5CK4xygiSykpcTcf1r
         jG1A==
X-Gm-Message-State: AOAM531wQq9TOLvXuMbfV0sBcdI1wRVqGBeb9RUzbcyuL5OTrLNUYrVc
        0PgE0nAe6LoiWJN/pO2xTm7iZw==
X-Google-Smtp-Source: ABdhPJwPxg0VeG81i9p0d0Xp/Ilpo4o1aNYtAJHzWFbGpThw1h1pxb4MXkRTHJzf7a17aSwY0Niqjg==
X-Received: by 2002:a17:90b:1087:: with SMTP id gj7mr12163713pjb.124.1592719687047;
        Sat, 20 Jun 2020 23:08:07 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q36sm9700009pjq.18.2020.06.20.23.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 23:08:06 -0700 (PDT)
Date:   Sat, 20 Jun 2020 23:05:19 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 18/21] regulator: qcom_smd: Fix pmi8994 label
Message-ID: <20200621060519.GB2421@builder.lan>
References: <20200620144639.335093-1-konradybcio@gmail.com>
 <20200620144639.335093-19-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200620144639.335093-19-konradybcio@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat 20 Jun 07:46 PDT 2020, Konrad Dybcio wrote:

> s3 was mislabeled as s2. Fix it.
> 
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/regulator/qcom_smd-regulator.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/regulator/qcom_smd-regulator.c b/drivers/regulator/qcom_smd-regulator.c
> index 53a64d856926..7f5c318c8259 100644
> --- a/drivers/regulator/qcom_smd-regulator.c
> +++ b/drivers/regulator/qcom_smd-regulator.c
> @@ -821,7 +821,7 @@ static const struct rpm_regulator_data rpm_pm8994_regulators[] = {
>  static const struct rpm_regulator_data rpm_pmi8994_regulators[] = {
>  	{ "s1", QCOM_SMD_RPM_SMPB, 1, &pmi8994_ftsmps, "vdd_s1" },
>  	{ "s2", QCOM_SMD_RPM_SMPB, 2, &pmi8994_hfsmps, "vdd_s2" },
> -	{ "s2", QCOM_SMD_RPM_SMPB, 3, &pmi8994_hfsmps, "vdd_s3" },
> +	{ "s3", QCOM_SMD_RPM_SMPB, 3, &pmi8994_hfsmps, "vdd_s3" },
>  	{ "boost-bypass", QCOM_SMD_RPM_BBYB, 1, &pmi8994_bby, "vdd_bst_byp" },
>  	{}
>  };
> -- 
> 2.27.0
> 
