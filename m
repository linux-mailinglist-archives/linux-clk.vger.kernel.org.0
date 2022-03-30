Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC9394EC505
	for <lists+linux-clk@lfdr.de>; Wed, 30 Mar 2022 14:56:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242840AbiC3M6A (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 30 Mar 2022 08:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345425AbiC3M57 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Mar 2022 08:57:59 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64B0A1D2074
        for <linux-clk@vger.kernel.org>; Wed, 30 Mar 2022 05:56:13 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id bq24so19697629lfb.5
        for <linux-clk@vger.kernel.org>; Wed, 30 Mar 2022 05:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=G5HJzN7yLosBTkE6FblfJhF8/NxTEia64Q4IDEWiIUY=;
        b=QwfPAD+9wwtOxMGPx3FuoweZ9OmsOzbFFUoPPM4R81ypDZdDHjAVZqBfEQ/MCcEXFm
         qzgZmn3q75tuixnjAwl1C3n/Hm+NRs9wji7+rfoqk2G1/jZzbzponHpetWW0XMSWqQtD
         mj69FKBVmfKntzvJR1RLQ0hsY/LPdRTQFcAvagy5SGOSiRp2+n0hVibQ0f9t5aMApovc
         oXIDttUEWfkxn7n4V8xv8fgqVq9awCBnj8cTNVDr05iJx7ZoxuOS3dylB+XTeP7zqEqi
         l1pGxDRwcw6kZYZdIU0XQx8TXO9IIX8nlCEgrn0mVVb623ZPuptOiOBYFospCC2u4ANS
         ifdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=G5HJzN7yLosBTkE6FblfJhF8/NxTEia64Q4IDEWiIUY=;
        b=E8ycpcjM7n7hW2aIh+X1vFGUxSaqVj0O3qlw6wwpP3U4GMuPTJowK3ae9klTiUMmV7
         XQ8jBdYSJGhC6pDK5nDa6TtxVifLG2ICj3SOxcr+6OlTSZo1GV3/iBNshxzeZ+j/KUSj
         IjpJlkm9laBHmJWXV7lHOFyP3hRSQmBa/Zp3yOjBAcIOf+PVrSsvbQs+G9BypJ/EiK+4
         63A9IypxCRFjkmOEmvTBNG9rCwYnHy2SfO+P0YxJeuKg0bVMlx1p3jQOQwz358SbrgNQ
         +2+JyHuDVfrWqk+6cGNWHWLd6OmdEYYQLRBg/XxrDmy5INfoXNZfTosaHFxdOgEBemqe
         4w6g==
X-Gm-Message-State: AOAM530c4aT7jiBB1bY5ImXjaC1vmwrQjDCIn2APwrfTqKte/VbEOUPd
        TQG50lTAfM+420jjK3opJQ9ykg==
X-Google-Smtp-Source: ABdhPJz0ETGvRlDBDOivkyi/5XpRFV5fGpwgEKcaUN5wmAZnanZInTJpmaYJHQCoxwseyYPRJLLpFg==
X-Received: by 2002:a05:6512:118b:b0:438:b7ad:11a2 with SMTP id g11-20020a056512118b00b00438b7ad11a2mr6656755lfr.295.1648644968195;
        Wed, 30 Mar 2022 05:56:08 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h6-20020a2e5306000000b00247e893075asm2367302ljb.37.2022.03.30.05.56.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Mar 2022 05:56:07 -0700 (PDT)
Message-ID: <edfff61f-02a0-7962-a72c-97ef5f14ba76@linaro.org>
Date:   Wed, 30 Mar 2022 15:56:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 0/5] PCI: qcom: rework pipe_clk/pipe_clk_src handling
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Prasad Malisetty <quic_pmaliset@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20220323085010.1753493-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220323085010.1753493-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/03/2022 11:50, Dmitry Baryshkov wrote:
> PCIe pipe clk (and some other clocks) must be parked to the "safe"
> source (bi_tcxo) when corresponding GDSC is turned off and on again.
> Currently this is handcoded in the PCIe driver by reparenting the
> gcc_pipe_N_clk_src clock.
> 
> Instead of doing it manually, follow the approach used by
> clk_rcg2_shared_ops and implement this parking in the enable() and
> disable() clock operations for respective pipe clocks.

Prasad, can we please get your comments on this patchset?
Since you have submitted original patchset for sc7280, it looks like you 
should be interested in testing that this patchset doesn't break your 
devices.

> 
> Changes since RFC:
>   - Rework clk-regmap-mux fields. Specify safe parent as P_* value rather
>     than specifying the register value directly
>   - Expand commit message to the first patch to specially mention that
>     it is required only on newer generations of Qualcomm chipsets.
> 
> Dmitry Baryshkov (5):
>    clk: qcom: regmap-mux: add pipe clk implementation
>    clk: qcom: gcc-sm8450: use new clk_regmap_mux_safe_ops for PCIe pipe
>      clocks
>    clk: qcom: gcc-sc7280: use new clk_regmap_mux_safe_ops for PCIe pipe
>      clocks
>    PCI: qcom: Remove unnecessary pipe_clk handling
>    PCI: qcom: Drop manual pipe_clk_src handling
> 
>   drivers/clk/qcom/clk-regmap-mux.c      | 78 +++++++++++++++++++++++
>   drivers/clk/qcom/clk-regmap-mux.h      |  3 +
>   drivers/clk/qcom/gcc-sc7280.c          |  6 +-
>   drivers/clk/qcom/gcc-sm8450.c          |  6 +-
>   drivers/pci/controller/dwc/pcie-qcom.c | 87 +-------------------------
>   5 files changed, 92 insertions(+), 88 deletions(-)
> 


-- 
With best wishes
Dmitry
