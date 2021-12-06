Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F371469ED5
	for <lists+linux-clk@lfdr.de>; Mon,  6 Dec 2021 16:41:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385655AbhLFPo3 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 6 Dec 2021 10:44:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358782AbhLFPia (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Dec 2021 10:38:30 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A7B7C08EB29
        for <linux-clk@vger.kernel.org>; Mon,  6 Dec 2021 07:24:28 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id v15-20020a9d604f000000b0056cdb373b82so14038613otj.7
        for <linux-clk@vger.kernel.org>; Mon, 06 Dec 2021 07:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4VchXGJRi71YWOB3jfH3EvBS4JbDgo7AC6aCyYRNxBo=;
        b=hRBhG4h3uAW80lbyu5dGURg+fH9Rklm6Q1dqgkwjDS1YPldKKhm1kxwSdvOQk9F6xY
         HQm0jRriMz15FczzIezD0t1LHyQQpg4TUT2QuiE0HKS9N4n4UiHpFZ1X8svb+02nJCSj
         lN5hQBzVtC0a4ooTSmIguHWeWPl1UuZGeMxDXV4kPzGmlOe2Ceqt6NAK34oj8FxI5rZ1
         BLAWfEpXN71e92fNXx8KzDsVN0i80mBYtkf7tTpVCcdtfRWwpqN34duabRcvLTDyNyOb
         PIL6SW/1IU+Psqg6sYBB8YllygFRB21Y6/RxftM6ucBGLHSgjoFp/6Nfo1ACDB69PQ4b
         b2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4VchXGJRi71YWOB3jfH3EvBS4JbDgo7AC6aCyYRNxBo=;
        b=HKvzaLH0+r5+9HvO3+Dq9HXYHImTdx8RPenljf1NKePFByVhYfvkTPgkGIS59eGYNc
         WYnG2XXUgzLovL8tMEKS3nxKzZkrNGD1c3EFK44yYE2o9JMJJn/O/+pFhmoIXJ7Dfkgd
         6K7QGqEGlqPqykxfGzCqX3wuJvTLyqKOrNSbq1nNJjiVWTsoOm+mpITV/qIbkgdouFz3
         6vzJaohTMVoiib6TTORR/RM7cqgD8tPBA7NgMot4wZ3ZGRcNHTiygYVPeG+x67APWgo6
         niFFH/+6MM+I7399h8CEtiLP8KLolm5ydDdC5kEYQrnlFeCoZe7/iCTM/w03nIwJrTOV
         nUFA==
X-Gm-Message-State: AOAM531W2Gpw9jV7ETQcSOuLuf25Rt8B8uY8Qt9i6YYy8ZNtJ1y7gk0c
        hosaFRjXzG2XlUprqIEBGBiJXbn4oDC3ag==
X-Google-Smtp-Source: ABdhPJxX+a16IMjtH56euBWFjix7tt/mv2Fzl9Hcocp1woXhLoe0dpZYb84hSpzPcBa+ihCCPyJXYQ==
X-Received: by 2002:a9d:ed6:: with SMTP id 80mr29824055otj.35.1638804267774;
        Mon, 06 Dec 2021 07:24:27 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id bf17sm2888192oib.27.2021.12.06.07.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 07:24:26 -0800 (PST)
Date:   Mon, 6 Dec 2021 09:24:21 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: qcom: smd-rpm: Drop the use of struct rpm_cc
Message-ID: <Ya4rJUU6tBOw3cGw@builder.lan>
References: <20211031020715.21636-1-shawn.guo@linaro.org>
 <20211031020715.21636-3-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211031020715.21636-3-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat 30 Oct 21:07 CDT 2021, Shawn Guo wrote:

> Considering that struct rpm_cc is now identical to rpm_smd_clk_desc,
> and function qcom_smdrpm_clk_hw_get() uses rpm_cc in a read-only manner,
> rpm_cc can be dropped by getting the function use rpm_smd_clk_desc
> directly.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/clk/qcom/clk-smd-rpm.c | 21 ++++-----------------
>  1 file changed, 4 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index a27c0e740ab7..dd3d373a1309 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -150,11 +150,6 @@ struct clk_smd_rpm_req {
>  	__le32 value;
>  };
>  
> -struct rpm_cc {
> -	struct clk_smd_rpm **clks;
> -	size_t num_clks;
> -};
> -
>  struct rpm_smd_clk_desc {
>  	struct clk_smd_rpm **clks;
>  	size_t num_clks;
> @@ -1157,20 +1152,19 @@ MODULE_DEVICE_TABLE(of, rpm_smd_clk_match_table);
>  static struct clk_hw *qcom_smdrpm_clk_hw_get(struct of_phandle_args *clkspec,
>  					     void *data)
>  {
> -	struct rpm_cc *rcc = data;
> +	const struct rpm_smd_clk_desc *desc = data;
>  	unsigned int idx = clkspec->args[0];
>  
> -	if (idx >= rcc->num_clks) {
> +	if (idx >= desc->num_clks) {
>  		pr_err("%s: invalid index %u\n", __func__, idx);
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> -	return rcc->clks[idx] ? &rcc->clks[idx]->hw : ERR_PTR(-ENOENT);
> +	return desc->clks[idx] ? &desc->clks[idx]->hw : ERR_PTR(-ENOENT);
>  }
>  
>  static int rpm_smd_clk_probe(struct platform_device *pdev)
>  {
> -	struct rpm_cc *rcc;
>  	int ret;
>  	size_t num_clks, i;
>  	struct qcom_smd_rpm *rpm;
> @@ -1190,13 +1184,6 @@ static int rpm_smd_clk_probe(struct platform_device *pdev)
>  	rpm_smd_clks = desc->clks;
>  	num_clks = desc->num_clks;
>  
> -	rcc = devm_kzalloc(&pdev->dev, sizeof(*rcc), GFP_KERNEL);
> -	if (!rcc)
> -		return -ENOMEM;
> -
> -	rcc->clks = rpm_smd_clks;
> -	rcc->num_clks = num_clks;
> -
>  	for (i = 0; i < num_clks; i++) {
>  		if (!rpm_smd_clks[i])
>  			continue;
> @@ -1222,7 +1209,7 @@ static int rpm_smd_clk_probe(struct platform_device *pdev)
>  	}
>  
>  	ret = devm_of_clk_add_hw_provider(&pdev->dev, qcom_smdrpm_clk_hw_get,
> -				     rcc);
> +					  (void *)desc);
>  	if (ret)
>  		goto err;
>  
> -- 
> 2.17.1
> 
