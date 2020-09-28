Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 220B627B4C3
	for <lists+linux-clk@lfdr.de>; Mon, 28 Sep 2020 20:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgI1Srx (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 28 Sep 2020 14:47:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726667AbgI1Srx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Sep 2020 14:47:53 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3BE1C0613CF
        for <linux-clk@vger.kernel.org>; Mon, 28 Sep 2020 11:47:52 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id c13so2476408oiy.6
        for <linux-clk@vger.kernel.org>; Mon, 28 Sep 2020 11:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Uy1ZmYHkl5eezp3nevvQWT2UA23xSL/opYDEOBgpQN4=;
        b=eebkfwy/dDOX0Rlv25j+42kAS2Fi3j9bnitcRWet2Q5aW4J0uPRStucw8vUZ+l1zhW
         qtAYTHeCR2WWqA8W0R2mxMH8YdD0flqCTWeIb7TbB3tyqGCFhshVpcAnbhnpkGii+VSK
         NK17NmX1ISzNHNyv/6PG2sbJIz47qtgeIuFtOHIKaCxfMYL9ZEYu+h4+rCepY6ZtWFJh
         K6mzA2mJdTEZ+sdOYYU+kg4/mwJRtCEJCnw3VLOpR4qkl7sjRJGgHBh/fRQvijcIfxao
         asCPBVfSI6WIr6WMl+AJlnuV7tsmhO0gb4QYg81SHgzjR5VYsVVayvLziizLAXUpFOql
         Iyyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Uy1ZmYHkl5eezp3nevvQWT2UA23xSL/opYDEOBgpQN4=;
        b=bc4Jf/srFpBRxkFAGT0nObmjN5xx7kubMMDRsPBjWQbVxAaYcK/u7SZ/SOkpB6Scdi
         Wg8Y3QusOndstm4nbINScsSEVmiRtqlPfmIp1zTVbSO/STC9PQzyRmgRhijh+tfZgWWm
         GfW3sa9jEfFipT3lVd1GT1ZIwEUp8UKX+YzMu3wiXk1lHX0ujZI+fYkHzjUULi7d7CzN
         +DNkZYLwletpW8VWAvmZFAJ0CnkCXYwtnPP3Gi6GWYijY77bXl/74JshWZT6/orVPWl+
         yTpAAzLeUyrwArWIGUViCn8IcWci3uEvRWOkvvgQQ4fD2zTCtPZ7xeX/A+ruDHcBkJkk
         c2aQ==
X-Gm-Message-State: AOAM530OsB5mcYezUlRsKAYshC4k8mVIpkE4Tk+6iv5/TqdCmQRnXFbG
        E37+6WZMMrdNHfoIuGNzSQmP+Q==
X-Google-Smtp-Source: ABdhPJwS2D9oyta/Wy8WhjS8IjtuM1KLnjkUekELwNKURqSpX6PjLMnZB91s0nj853RAVk6BSh+ghA==
X-Received: by 2002:aca:ac8e:: with SMTP id v136mr151341oie.113.1601318871887;
        Mon, 28 Sep 2020 11:47:51 -0700 (PDT)
Received: from builder.lan (99-135-181-32.lightspeed.austtx.sbcglobal.net. [99.135.181.32])
        by smtp.gmail.com with ESMTPSA id a2sm2270797ooo.26.2020.09.28.11.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 11:47:51 -0700 (PDT)
Date:   Mon, 28 Sep 2020 13:43:22 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Varadarajan Narayanan <varada@codeaurora.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, linus.walleij@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        nsekar@codeaurora.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, sricharan@codeaurora.org
Subject: Re: [PATCH 5/7] pinctrl: qcom: Add IPQ5018 pinctrl driver
Message-ID: <20200928184322.GB71055@builder.lan>
References: <1601270140-4306-1-git-send-email-varada@codeaurora.org>
 <1601270140-4306-6-git-send-email-varada@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1601270140-4306-6-git-send-email-varada@codeaurora.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon 28 Sep 00:15 CDT 2020, Varadarajan Narayanan wrote:
> diff --git a/drivers/pinctrl/qcom/pinctrl-ipq5018.c b/drivers/pinctrl/qcom/pinctrl-ipq5018.c
[..]
> +static const struct msm_function ipq5018_functions[] = {
[..]
> +	FUNCTION(qspi_clk),
> +	FUNCTION(qspi_cs),
> +	FUNCTION(qspi0),
> +	FUNCTION(qspi1),
> +	FUNCTION(qspi2),
> +	FUNCTION(qspi3),

Instead of having one function name per pin it typically leads to
cleaner DT if you group these under the same name (i.e. "qspi")

Same seems to apply to sdc, wci, xfem at least.

> +	FUNCTION(reset_out),
> +	FUNCTION(sdc1_clk),
> +	FUNCTION(sdc1_cmd),
> +	FUNCTION(sdc10),
> +	FUNCTION(sdc11),
> +	FUNCTION(sdc12),
> +	FUNCTION(sdc13),
> +	FUNCTION(wci0),
> +	FUNCTION(wci1),
> +	FUNCTION(wci2),
> +	FUNCTION(wci3),
> +	FUNCTION(wci4),
> +	FUNCTION(wci5),
> +	FUNCTION(wci6),
> +	FUNCTION(wci7),
> +	FUNCTION(wsa_swrm),
> +	FUNCTION(wsi_clk3),
> +	FUNCTION(wsi_data3),
> +	FUNCTION(wsis_reset),
> +	FUNCTION(xfem0),
> +	FUNCTION(xfem1),
> +	FUNCTION(xfem2),
> +	FUNCTION(xfem3),
> +	FUNCTION(xfem4),
> +	FUNCTION(xfem5),
> +	FUNCTION(xfem6),
> +	FUNCTION(xfem7),
> +};
> +static const struct msm_pingroup ipq5018_groups[] = {
> +	PINGROUP(0, atest_char0, _, qdss_cti_trig_out_a0, wci0, wci0, xfem0,

What's up with wci0 being both function 4 and 5?

> +		 _, _, _),
> +	PINGROUP(1, atest_char1, _, qdss_cti_trig_in_a0, wci1, wci1, xfem1,
> +		 _, _, _),

Please don't like break these, better blow the line length limit in
favor or readability.

> +	PINGROUP(2, atest_char2, _, qdss_cti_trig_out_a1, wci2, wci2, xfem2,
> +		 _, _, _),
> +	PINGROUP(3, atest_char3, _, qdss_cti_trig_in_a1, wci3, wci3, xfem3,
> +		 _, _, _),

Regards,
Bjorn
