Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 264AE4BD59A
	for <lists+linux-clk@lfdr.de>; Mon, 21 Feb 2022 06:45:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344649AbiBUFpN (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 21 Feb 2022 00:45:13 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344651AbiBUFpN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Feb 2022 00:45:13 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E2104AE2A
        for <linux-clk@vger.kernel.org>; Sun, 20 Feb 2022 21:44:50 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id x11so11998747pll.10
        for <linux-clk@vger.kernel.org>; Sun, 20 Feb 2022 21:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NzWld38SFAn0hncCzudzmSq8RQy5woIo/8NaM7ZRlas=;
        b=Cuwl6GcKQBZCFXxjfMHDQtmUYutqxwKOoNgd+YJ0Crd99cWuxr7geM3pGJEYiAXi7p
         BzonzPkIAXeCkxsilBTqgjbs2Thbw3zh6zyeFxSqvBKla0rJd8s3xZKAvXPYzUyXqz22
         cDiiHR+oc7BSDYW7ZE2a7fe26yXEsCLQpOHi57DnqTdrAFbCaiztVpgh6TPT6636tEnJ
         epphhWJ9sHnmUOo38BOF8NLz5+WSJJces3coennEUFQk8GwhVM2bhtZ7Mte/I1t1IaPZ
         PP1hYg1gQ+5HbWP7QMusHWZV5rgTiDQhts1DFDJfzx/Bsscm4tWzQwC9uHlaoUbIQKU/
         JrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NzWld38SFAn0hncCzudzmSq8RQy5woIo/8NaM7ZRlas=;
        b=0E+1uXEctY3n6TaGar8XOvf9lLZHb66ZitFFxxG9Yn7L7BEAPhKc95xFmL4JoM67Dr
         Fodz9FcIoQh7pQvRnD4l8/HwizKCOnxuV1JsaBM9j960+9LSbPfZYrk9jxdUp1CgLyHM
         vQ9CZZylFEQzZ+lYD6LUAqVXsmFWBMnRCBAhjVhojvBKybSKM6Ny1yF+9kGzG1BWnf9C
         sLLZO8c7p34cCXaS0jqZNLMNzuT0YUhoxYUosENlLhOtBmTcu//HZ65wixAhnB1YB+9F
         d8h3Neiky/woPZP45NlrODpoBz9ujkPbrCRWuDa6bhPOfA5l7ijkj/KAheIJOVI9PEAY
         mCpg==
X-Gm-Message-State: AOAM532tN07iTM+LvM0br2gQqtnA4ttsJxXNWCrWrx7ZRx5cHf9Ngr9c
        zo95cU26g8uP6/UjBZrvk8Rn
X-Google-Smtp-Source: ABdhPJybyjPoU57s6j8heaGBbT/bkCBRzKHxWrNmILlk0vP/V+o4r/o0qoyk/eurYtpWcxOGMQ0asQ==
X-Received: by 2002:a17:902:eb85:b0:14d:b906:cbd3 with SMTP id q5-20020a170902eb8500b0014db906cbd3mr17207331plg.122.1645422289873;
        Sun, 20 Feb 2022 21:44:49 -0800 (PST)
Received: from thinkpad ([220.158.158.223])
        by smtp.gmail.com with ESMTPSA id t7sm10941987pfj.138.2022.02.20.21.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 21:44:49 -0800 (PST)
Date:   Mon, 21 Feb 2022 11:14:45 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/7] Add APCS support for SDX65
Message-ID: <20220221054445.GD15108@thinkpad>
References: <1645420953-21176-1-git-send-email-quic_rohiagar@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1645420953-21176-1-git-send-email-quic_rohiagar@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Feb 21, 2022 at 10:52:26AM +0530, Rohit Agarwal wrote:
> Hello,
> 
> Changes from v2:
>  - Addressed Stephen's comments and made necessary changes.
>  - Rebased on top
> 
> Changes from v1:
>  - Addressed Mani's comments and made necessary changes.
>  - Removed the last patch from the series as it became redundant after making changes.
> 
> This series adds APCS mailbox and clock support for SDX65. The APCS IP
> in SDX65 provides IPC and clock functionalities. Hence, mailbox support
> is added to the "qcom-apcs-ipc-mailbox" driver and a dedicated clock
> driver "apcs-sdx65" is added.

You seem to have missed adding r-o-b tags.

Thanks,
Mani

> 
> Thanks,
> Rohit
> 
> Rohit Agarwal (7):
>   dt-bindings: mailbox: Add binding for SDX65 APCS
>   mailbox: qcom: Add support for SDX65 APCS IPC
>   dt-bindings: clock: Add A7 PLL binding for SDX65
>   clk: qcom: Add A7 PLL support for SDX65
>   ARM: dts: qcom: sdx65: Add support for A7 PLL clock
>   ARM: dts: qcom: sdx65: Add support for APCS block
>   clk: qcom: Add SDX65 APCS clock controller support
> 
>  Documentation/devicetree/bindings/clock/qcom,a7pll.yaml |  3 ++-
>  .../bindings/mailbox/qcom,apcs-kpss-global.yaml         |  1 +
>  arch/arm/boot/dts/qcom-sdx65.dtsi                       | 17 +++++++++++++++++
>  drivers/clk/qcom/Kconfig                                | 12 ++++++------
>  drivers/clk/qcom/a7-pll.c                               |  1 +
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c                 |  5 +++++
>  6 files changed, 32 insertions(+), 7 deletions(-)
> 
> -- 
> 2.7.4
> 
