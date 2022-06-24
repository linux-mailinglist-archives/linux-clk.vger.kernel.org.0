Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDE86559F1D
	for <lists+linux-clk@lfdr.de>; Fri, 24 Jun 2022 19:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231616AbiFXRGI (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 24 Jun 2022 13:06:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231565AbiFXRGG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Jun 2022 13:06:06 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC64849F82
        for <linux-clk@vger.kernel.org>; Fri, 24 Jun 2022 10:06:04 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id w193so4352253oie.5
        for <linux-clk@vger.kernel.org>; Fri, 24 Jun 2022 10:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0+0vhPEExLAjmHmvWpzqEFXlBkwHLniOzXACImlZjrY=;
        b=Y3mu5a2lveFJrWpQklsmSrTWN64yCIpvDo+RT/i91W74AZ3BUMW1bIWJYDW8u4SaUl
         dSSx0h06uVpA/sc7sE//Yjzbsc2ju4EIBKcm6Ctr6i2zNCe316zBQvuG7phJiGVrSvUA
         v3MwBaqJUkqC0QFHo/T+i+m5qlDKhoen47JoXF+6dwTQgqOHDe88bJKcHJ8Q2MXwNphU
         QzfqxpHXpilXixRBClD67ppKEhEEeYgmdOCx6zQyUJOT4mfCZ1XX9W4uYAuFUPxuyifF
         hPvrfJd9IIlsZd7mBsZG3aetEzsk77QGIH10KMy4Cv864w062iG8SILWrde16ZGhHxnX
         6rfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0+0vhPEExLAjmHmvWpzqEFXlBkwHLniOzXACImlZjrY=;
        b=Y4S8F+QEM/wdY0WtVcYR1Q0pMk+yvTIPsGDnBd6SOQ/8nNGr/GDRN7ytjcCJDswR0w
         FHzavRQl+kpmPvBHAMNx9r65pFxMP1YNp/FNdjaw3HalpmzUuc3hpgjtH8HGZ1UL1EJc
         vHpnN7nFMpI0JFihg71e5LScpujpBLFXRx+ikjqkiKP9/ul0PIUkfyOwzIvqpRBGQBrO
         ybBTRpGj2DMCU+YLbXOiotMRaCZN0nv3BEOQAGUv7WmxeEcvgjB6STazqzws/BO7ybee
         ZlBQ3Wk0rmK9HNxUMcCZbnmoUKMohle069W7UdJRpa2X9/sfR2hOrV2feh3a6FkNn1Z1
         Gl5Q==
X-Gm-Message-State: AJIora8N/IR/5B+6TbNCzmXRVyzbWj/nn5jp0CUwbDawNv7Mxfaz8pcT
        gI6H8hqXJ72H2kUZ1SZ386VV2w==
X-Google-Smtp-Source: AGRyM1txfnmyDcykZy0fXC5KNNgxnfMaOc//EpKeR/oIrHOotIDXvosZFm+cAeMGPhFMd4+XEsa78A==
X-Received: by 2002:a05:6808:23cb:b0:335:2987:1209 with SMTP id bq11-20020a05680823cb00b0033529871209mr38099oib.69.1656090364070;
        Fri, 24 Jun 2022 10:06:04 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id i14-20020a056830402e00b0060b128b935csm1807450ots.39.2022.06.24.10.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 10:06:03 -0700 (PDT)
Date:   Fri, 24 Jun 2022 10:08:05 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette ? <mturquette@baylibre.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/4] clk: qcom: sc7280: Update clk_init_data to const
 for GCC
Message-ID: <YrXvdWe5c1ZdS0AR@ripper>
References: <20220202183528.3911-1-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220202183528.3911-1-tdas@codeaurora.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed 02 Feb 10:35 PST 2022, Taniya Das wrote:

> Update clk_init_data to const and also use index instead of fw_name for
> global clock controller.
> 
> Fixes: a3cc092196ef6 ("clk: qcom: Add Global Clock controller (GCC) driver for SC7280")
> Signed-off-by: Taniya Das <tdas@codeaurora.org>

Hi Taniya,

I'm not able to find a new revision of this series in the inbox, could
you please respin it?

> ---
>  drivers/clk/qcom/gcc-sc7280.c | 362 +++++++++++++++++-----------------
>  1 file changed, 181 insertions(+), 181 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
> index 423627d49719..ccecd3d8a6d9 100644
> --- a/drivers/clk/qcom/gcc-sc7280.c
> +++ b/drivers/clk/qcom/gcc-sc7280.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2020-2022, The Linux Foundation. All rights reserved.
>   */
> 
>  #include <linux/clk-provider.h>
> @@ -45,10 +45,10 @@ static struct clk_alpha_pll gcc_gpll0 = {
>  	.clkr = {
>  		.enable_reg = 0x52010,
>  		.enable_mask = BIT(0),
> -		.hw.init = &(struct clk_init_data){
> +		.hw.init = &(const struct clk_init_data){

And while doing so, please split this into one patch adding the const...

>  			.name = "gcc_gpll0",
>  			.parent_data = &(const struct clk_parent_data){
> -				.fw_name = "bi_tcxo",
> +				.index = 0,

and a separate patch changing fw_name to index. If there are regressions
we want to be able to bisect it down to the right one.

Also, please add a define for BI_TCXO, instead of having a comment in
most places - like I did in gcc-sc8280xp.c (but as we have existing dts
I don't think it's wise to replace all fw_name entries with .index)..

Thanks,
Bjorn
