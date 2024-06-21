Return-Path: <linux-clk+bounces-8481-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7BF912F4C
	for <lists+linux-clk@lfdr.de>; Fri, 21 Jun 2024 23:18:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EF541F22039
	for <lists+linux-clk@lfdr.de>; Fri, 21 Jun 2024 21:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800BD17BB3B;
	Fri, 21 Jun 2024 21:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="caapiA1m"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E84F16DED5
	for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 21:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719004676; cv=none; b=scZ+7BhOH9TATUPb2sqQW2IDG+PE//L8lN7PitfuQdMVnrPNVzvp6Q1GrPOFW9R+nHiinojw9GsoxpXhdPHTR14VykJ0ii3a7T27IKfw73dnXcv28AHlmAOToaQ704wg6ngMDFm6Pr/eRI3Ye+qM2QdgKUMD2E+ihYAUN0BXRe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719004676; c=relaxed/simple;
	bh=ejKkPFJaB3Ka3fsapPQVUzX9N5WhhAbWiXLA/TvXHh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fIr3aQoD0OckwxCWfPEnoZvRGp7mAIEoyM32OGwN0RXthJvsX/U2nd9AYVAu0AbWNbeuanvAQGQUvayp0cJYDmkkaQ9kREXyFlSnktb2mVck6go4shvw6XVP6ywK2Q/aWuELk6ggodvy0yy/kKVAGnwkOjqP7gLDJGkoLpoQtQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=caapiA1m; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ec4eefbaf1so10506351fa.1
        for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 14:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719004673; x=1719609473; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M+XDYN6E55Q8wiev+4hnFYw5SQkDqC6ydMWbbsnc6Uw=;
        b=caapiA1mTW1PO+/g1XlZx1enhgS5J4ZyAptW2qQGzYPHw7rW2S5DF66MWkdQAzuYRP
         TCoa24H+lde/cHkMw9mVn1G+HKrCUDRZRR23lc3G/atGLdeBKEq9ekqEQ7Tw7vUq8hxA
         e9fFrCIrwR8MCzxjkh5LWB+tDIW+uBLTDeI/EbjdRbJ3oWau8S9esuv5D2/5VcPEzsBg
         mujjerUJLa8uut7cHPBlq6CE/HZTFiDvsV79qPx5d79rQ55WHUVK9GykFJ617WlgAfa7
         lyR9N2GEXEAo+9k7jBFJdKyW7hivKYYbsg3b3enXez9wxFrPQZKquBqc4UqUO/n6aOZ5
         K8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719004673; x=1719609473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+XDYN6E55Q8wiev+4hnFYw5SQkDqC6ydMWbbsnc6Uw=;
        b=FuYi2mHqPTAk6dBAdejSTNxeSVgRoUbrVvrt3r5/+lawAJnwxypFYFbEz8ORvTbI5E
         Y/nOkNcptvD90c0Xkv0Cs3hjWQ1AX625qTwaVR6d7meCFzEXmqZULThcqRl5QjjBrZes
         emvDg9OWlv/9clJo8NQm4BiwIv18t3dloUM68+M/oddl9I8bCJtF07XpcPMkIPeIsCPF
         RLHTzbax1OX/9qLLiQQPZ9jTQeNrsEgCvHndmEJ2PRJ1B+doy/0nswjsK9Eq7QQTxdoI
         p2lAgCnqagH+uXu4sTZCmhEcq05lWoUxRLtXzm8l9+lDoChjSgXrStd0MaG6stYDPejT
         gZbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCORXJw+rLSOYWRnlZkApZGft34lFaBdw7H1lC9yDWjM7CgIwPv4EvJrFuD8qI2/mFiLX6nDuqZ/d/X1xFavoMnwjc/QbZdXuM
X-Gm-Message-State: AOJu0Yzwir/sDrW11WcySzT5BKYE6C92PuNrEOoAr9TBoXWGvnYhGwW+
	FH9Sr7QJrj1+SLR3pakHELoV3ddW/jOqZTvzNGeOw7NnNEnrba4UM5imjtgEu6M=
X-Google-Smtp-Source: AGHT+IG5ONtAHMiAMkjrKYk/XJYpMtsQK2fNUz21XwNvYiifq/ErR6C5eSVfLnXD9V5NnA9w+MvPuw==
X-Received: by 2002:a2e:980b:0:b0:2ec:5365:34db with SMTP id 38308e7fff4ca-2ec536537eemr6903361fa.0.1719004672703;
        Fri, 21 Jun 2024 14:17:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec511dac51sm1707251fa.74.2024.06.21.14.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 14:17:52 -0700 (PDT)
Date: Sat, 22 Jun 2024 00:17:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Cc: sboyd@kernel.org, andersson@kernel.org, bjorn.andersson@linaro.org, 
	david.brown@linaro.org, devicetree@vger.kernel.org, jassisinghbrar@gmail.com, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com, 
	robh@kernel.org, sricharan@codeaurora.org, gokulsri@codeaurora.org
Subject: Re: [PATCH v9 2/8] remoteproc: qcom: Add secure PIL support
Message-ID: <mew7kifravbescnenvstmebfxkbpwdnarmagh6v4a2hqnbrxc6@cepyqz4vgum6>
References: <20240621114659.2958170-1-quic_gokulsri@quicinc.com>
 <20240621114659.2958170-3-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621114659.2958170-3-quic_gokulsri@quicinc.com>

On Fri, Jun 21, 2024 at 05:16:53PM GMT, Gokul Sriram Palanisamy wrote:
> IPQ8074 uses secure PIL. Hence, adding the support for the same.

See Documentation/process/submitting-patches.rst

> 
> Signed-off-by: Nikhil Prakash V <quic_nprakash@quicinc.com>
> Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> ---
>  drivers/remoteproc/qcom_q6v5_wcss.c | 43 +++++++++++++++++++++++++++--
>  1 file changed, 40 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
> index 366b19cbd994..e45e79d80238 100644
> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
> @@ -18,6 +18,7 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
>  #include <linux/soc/qcom/mdt_loader.h>
> +#include <linux/firmware/qcom/qcom_scm.h>
>  #include "qcom_common.h"
>  #include "qcom_pil_info.h"
>  #include "qcom_q6v5.h"
> @@ -86,6 +87,9 @@
>  #define TCSR_WCSS_CLK_ENABLE	0x14
>  
>  #define MAX_HALT_REG		3
> +
> +#define WCNSS_PAS_ID		6
> +
>  enum {
>  	WCSS_IPQ8074,
>  	WCSS_QCS404,
> @@ -134,6 +138,7 @@ struct q6v5_wcss {
>  	unsigned int crash_reason_smem;
>  	u32 version;
>  	bool requires_force_stop;
> +	bool need_mem_protection;

needs

>  
>  	struct qcom_rproc_glink glink_subdev;
>  	struct qcom_rproc_ssr ssr_subdev;
> @@ -152,6 +157,7 @@ struct wcss_data {
>  	int ssctl_id;
>  	const struct rproc_ops *ops;
>  	bool requires_force_stop;
> +	bool need_mem_protection;

needs

>  };
>  
>  static int q6v5_wcss_reset(struct q6v5_wcss *wcss)
> @@ -251,6 +257,15 @@ static int q6v5_wcss_start(struct rproc *rproc)
>  
>  	qcom_q6v5_prepare(&wcss->q6v5);
>  
> +	if (wcss->need_mem_protection) {
> +		ret = qcom_scm_pas_auth_and_reset(WCNSS_PAS_ID);
> +		if (ret) {
> +			dev_err(wcss->dev, "wcss_reset failed\n");
> +			return ret;
> +		}
> +		goto wait_for_reset;
> +	}

Use if/else instead of a goto.

> +
>  	/* Release Q6 and WCSS reset */
>  	ret = reset_control_deassert(wcss->wcss_reset);
>  	if (ret) {
> @@ -285,6 +300,7 @@ static int q6v5_wcss_start(struct rproc *rproc)
>  	if (ret)
>  		goto wcss_q6_reset;
>  
> +wait_for_reset:

This is more like wait_for_start

>  	ret = qcom_q6v5_wait_for_start(&wcss->q6v5, 5 * HZ);
>  	if (ret == -ETIMEDOUT)
>  		dev_err(wcss->dev, "start timed out\n");
> @@ -718,6 +734,15 @@ static int q6v5_wcss_stop(struct rproc *rproc)
>  	struct q6v5_wcss *wcss = rproc->priv;
>  	int ret;
>  
> +	if (wcss->need_mem_protection) {
> +		ret = qcom_scm_pas_shutdown(WCNSS_PAS_ID);
> +		if (ret) {
> +			dev_err(wcss->dev, "not able to shutdown\n");
> +			return ret;
> +		}
> +		goto pas_done;
> +	}

if/else. Or abstract this to functions.

> +
>  	/* WCSS powerdown */
>  	if (wcss->requires_force_stop) {
>  		ret = qcom_q6v5_request_stop(&wcss->q6v5, NULL);
> @@ -742,6 +767,7 @@ static int q6v5_wcss_stop(struct rproc *rproc)
>  			return ret;
>  	}
>  
> +pas_done:
>  	clk_disable_unprepare(wcss->prng_clk);
>  	qcom_q6v5_unprepare(&wcss->q6v5);
>  
> @@ -765,9 +791,15 @@ static int q6v5_wcss_load(struct rproc *rproc, const struct firmware *fw)
>  	struct q6v5_wcss *wcss = rproc->priv;
>  	int ret;
>  
> -	ret = qcom_mdt_load_no_init(wcss->dev, fw, rproc->firmware,
> -				    0, wcss->mem_region, wcss->mem_phys,
> -				    wcss->mem_size, &wcss->mem_reloc);
> +	if (wcss->need_mem_protection)
> +		ret = qcom_mdt_load(wcss->dev, fw, rproc->firmware,
> +				    WCNSS_PAS_ID, wcss->mem_region,
> +				    wcss->mem_phys, wcss->mem_size,
> +				    &wcss->mem_reloc);
> +	else
> +		ret = qcom_mdt_load_no_init(wcss->dev, fw, rproc->firmware,
> +					    0, wcss->mem_region, wcss->mem_phys,
> +					    wcss->mem_size, &wcss->mem_reloc);
>  	if (ret)
>  		return ret;
>  
> @@ -1035,6 +1067,9 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
>  	if (!desc)
>  		return -EINVAL;
>  
> +	if (desc->need_mem_protection && !qcom_scm_is_available())
> +		return -EPROBE_DEFER;
> +
>  	rproc = devm_rproc_alloc(&pdev->dev, pdev->name, desc->ops,
>  				 desc->firmware_name, sizeof(*wcss));
>  	if (!rproc) {
> @@ -1048,6 +1083,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
>  
>  	wcss->version = desc->version;
>  	wcss->requires_force_stop = desc->requires_force_stop;
> +	wcss->need_mem_protection = desc->need_mem_protection;
>  
>  	ret = q6v5_wcss_init_mmio(wcss, pdev);
>  	if (ret)
> @@ -1111,6 +1147,7 @@ static const struct wcss_data wcss_ipq8074_res_init = {
>  	.wcss_q6_reset_required = true,
>  	.ops = &q6v5_wcss_ipq8074_ops,
>  	.requires_force_stop = true,
> +	.need_mem_protection = true,
>  };
>  
>  static const struct wcss_data wcss_qcs404_res_init = {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

