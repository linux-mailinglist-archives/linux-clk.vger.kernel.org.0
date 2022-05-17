Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55C2F52ABC9
	for <lists+linux-clk@lfdr.de>; Tue, 17 May 2022 21:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352616AbiEQTRB (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 17 May 2022 15:17:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352621AbiEQTRA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 May 2022 15:17:00 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A06A40E64
        for <linux-clk@vger.kernel.org>; Tue, 17 May 2022 12:16:58 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id z18so20350926iob.5
        for <linux-clk@vger.kernel.org>; Tue, 17 May 2022 12:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=SQNeGam941FyeYXfP6H024jLtY0W9iMsQ2X/6H/zyv4=;
        b=TZ6691FI6m5zA3ekA8MacmwwWfITp2KMzwxtkyn6VhHryu0URKRSf5U6hzk2o6YEzs
         /2z7/Otn9ulaWMuhAzXTxR9YQLB7sGStaoIgHG/5rejKgshJVheE98gvvAnAFiVWsm1r
         jWtVnpwuHWiSArCpL0HDfdMCUr8guYrHUS0d/3HqbBS7aM4I6dmvCAHkUf+Xc6oxk/cK
         2ErurirVC4muZeOmN8osOwbn1KF2xWouBhrCi6JbYc5/Q0/zyx0wswU3HzICtJhx4Xld
         JvfgTJ/ZOd+w940g/OrO6lLGHVvsGk1UgtjWbY1QkFUYYqq4K5uvwaUv0ya5M2glAtJF
         t7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=SQNeGam941FyeYXfP6H024jLtY0W9iMsQ2X/6H/zyv4=;
        b=ZLVXo4pHPzfYQ+CK32Cdqe3aMbZ94VWHLCHmSa2CHqj25pLYB+Z/pIqOfqk6xn8FrO
         WK1FZtQlq0dXHROXQ5YwrtU6VQ9tvtdKIcm8oPpUbxh8Bb48XsWpMf4yxSI7uSNedoX+
         H/KXell4DB6vZE4Md+PzjccBdwP8g+nTbMLqJqq8GOSZwbY4EsdCANeGOLNJYeMeBx2g
         BJfjBfanyKu1O+h5uoC8TPkEGwn1c6TSm32D1dPyfV2dtVH8nxx6ZkyJwwktZJpH3UBC
         +FfQcyTj1TChvCjHuPHvc2/CwfuOSksPDR9cHFEjPMuQ+sQvAA5sxucowJ477+YCo6Kc
         r7OA==
X-Gm-Message-State: AOAM530u14kQb4bx2U0Izw2Cc0W4r7lu8LilGFhQcTlajNph5sIY1YUO
        N78tJNqMi+YG5tJUeS4H5mxf8g==
X-Google-Smtp-Source: ABdhPJxDhTVWIPPMBpBGsJcP3dVUHpJcrXrs/pNnfXxoooYjG+qzq8ftii09HIyPmpMBcZiZGiwYNQ==
X-Received: by 2002:a05:6638:48:b0:32e:4b7e:aec5 with SMTP id a8-20020a056638004800b0032e4b7eaec5mr4032636jap.186.1652815017720;
        Tue, 17 May 2022 12:16:57 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id u6-20020a056e02080600b002cde6e352c9sm39560ilm.19.2022.05.17.12.16.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 May 2022 12:16:57 -0700 (PDT)
Message-ID: <cb32f8c6-8a4a-cc3d-4154-a4377a238628@linaro.org>
Date:   Tue, 17 May 2022 14:16:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] clk: qcom: rpmh: Add note about sleep/wake state for BCMs
Content-Language: en-US
To:     Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        patches@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        Taniya Das <quic_tdas@quicinc.com>
References: <20220517190949.2922197-1-swboyd@chromium.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20220517190949.2922197-1-swboyd@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 5/17/22 2:09 PM, Stephen Boyd wrote:
> The sleep/wake state doesn't need to be set here because of specific
> RPMh behavior that carries over the active state when sleep/wake state
> hasn't been modified. Add a note to the code so we aren't tempted to set
> the sleep/wake states.
> 
> Cc: Alex Elder <elder@linaro.org>
> Cc: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Looks good to me.  Thanks Stephen.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
> 
> This superseedes a previous patch[1] I sent that tried to fix this.
> 
>   drivers/clk/qcom/clk-rpmh.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index aed907982344..c07cab6905cb 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -274,6 +274,11 @@ static int clk_rpmh_bcm_send_cmd(struct clk_rpmh *c, bool enable)
>   		cmd.addr = c->res_addr;
>   		cmd.data = BCM_TCS_CMD(1, enable, 0, cmd_state);
>   
> +		/*
> +		 * Send only an active only state request. RPMh continues to
> +		 * use the active state when we're in sleep/wake state as long
> +		 * as the sleep/wake state has never been set.
> +		 */
>   		ret = clk_rpmh_send(c, RPMH_ACTIVE_ONLY_STATE, &cmd, enable);
>   		if (ret) {
>   			dev_err(c->dev, "set active state of %s failed: (%d)\n",
> 
> base-commit: 42226c989789d8da4af1de0c31070c96726d990c

