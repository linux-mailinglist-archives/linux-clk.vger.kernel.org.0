Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D5826617C7
	for <lists+linux-clk@lfdr.de>; Sun,  8 Jan 2023 19:08:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235893AbjAHSIY (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 8 Jan 2023 13:08:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236096AbjAHSID (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 8 Jan 2023 13:08:03 -0500
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E43F862F7
        for <linux-clk@vger.kernel.org>; Sun,  8 Jan 2023 10:08:01 -0800 (PST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-4a2f8ad29d5so86401797b3.8
        for <linux-clk@vger.kernel.org>; Sun, 08 Jan 2023 10:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4ChnjU9YbuZ13rH7KVo18kVjbNMaQprgxl7zjJjRkWs=;
        b=toYtzeXXIY+ryyN/f69MbTo8Z5aAe370LB5gvHIxQjmXPMWILeSldYQP6IzvF8oejM
         /fdLRUQrf+lRX1QTRfBAyVVCTwEQXXVaZEmhDzpLjQArCSHMxB4cU9ZiEsL8emYb1uik
         r92XRXg9VAgbeXMxwnsKABj74UtVMhCOO5p08U2zZWgOb0AFO/SGKbc+KZQUjj6flgkM
         qNAR86sMj14ynmE1gzSKh4/rveMur3xaPgKVq3u9cAZ3z/E+h/5JsMbY0V1gwxmJEgzI
         qK56zVXwbYio5ajXB3psUfc76m+cdnwuGIXeqpZu1M9Xy4aeA/S7miYi0rRnkjVpGwSF
         U6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ChnjU9YbuZ13rH7KVo18kVjbNMaQprgxl7zjJjRkWs=;
        b=Ec81k8MpaW4h4hTUwjvVLa0NfAzZZnd7gwDoxWaH4eFNHSOLFw5A9dnq5f6++1tM20
         aBXB5kWKv66uh+jl9xecjJ1O/4e5F+GxuqPj6L9YcNH8zPvhlY6qnCCi049Bb02cVjK8
         Vty1FwcmvjKibCA4pDB3pQXp8heJqEGPVLf6+/KpYcb1Rg/0CknjPE2Pi9TfNcKfb9CY
         AyppLLGLGJBxN4fHGSmCaWRVDWnaVh0plF9Q6BsBLrHDZJuXeE7JYe2ltVagGIbkOh1M
         7+MrYzz3rTfpoyCUNjMzFz6kBY0+O7NhugFZ+jZhq12UeG30ZyIsNRDuThWsVAYpBJkq
         xfLw==
X-Gm-Message-State: AFqh2koQS/oeXXfQ9g2RA7PtglnLiMV4k43vZihv8ujesV12vMC3axBs
        9iNEcpZGNd32VB1yIHC9dofl+NC83tmh1ug9/t2INg==
X-Google-Smtp-Source: AMrXdXvRATLoWrYC/oxApPCf1h7WRndmi9qlr/xuITHgDA0N7uhTKkKTER5n3YAIsXIihhhxzBusmtgzVHB/vs9Yigo=
X-Received: by 2002:a0d:e3c3:0:b0:432:2458:f6ca with SMTP id
 m186-20020a0de3c3000000b004322458f6camr1262710ywe.138.1673201281164; Sun, 08
 Jan 2023 10:08:01 -0800 (PST)
MIME-Version: 1.0
References: <20230108130440.670181-1-robimarko@gmail.com> <20230108130440.670181-2-robimarko@gmail.com>
 <CAA8EJprb1nC6LCbPQ18tU=apxY+8YfvL2uhrVzwgqJ+GXsjEvQ@mail.gmail.com> <CAOX2RU5zSDppy-EsBJDmwQpD=GqXJTPd_m=5RFZFb7WvB5etqA@mail.gmail.com>
In-Reply-To: <CAOX2RU5zSDppy-EsBJDmwQpD=GqXJTPd_m=5RFZFb7WvB5etqA@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 8 Jan 2023 20:07:50 +0200
Message-ID: <CAA8EJpqFDa-4+0YAHO0s2dZqBX6zLSWir+OgyoN5BZyet1hMyg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq8074: correct USB3 QMP PHY-s
 clock output names
To:     Robert Marko <robimarko@gmail.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, 8 Jan 2023 at 20:04, Robert Marko <robimarko@gmail.com> wrote:
>
> On Sun, 8 Jan 2023 at 18:32, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Sun, 8 Jan 2023 at 15:04, Robert Marko <robimarko@gmail.com> wrote:
> > >
> > > It seems that clock-output-names for the USB3 QMP PHY-s where set without
> > > actually checking what is the GCC clock driver expecting, so clock core
> > > could never actually find the parents for usb0_pipe_clk_src and
> > > usb1_pipe_clk_src clocks in the GCC driver.
> > >
> > > So, correct the names to be what the driver expects so that parenting
> > > works.
> > >
> > > Before:
> > > gcc_usb0_pipe_clk_src                0        0        0   125000000          0     0  50000         Y
> > > gcc_usb1_pipe_clk_src                0        0        0   125000000          0     0  50000         Y
> > >
> > > After:
> > >  usb3phy_0_cc_pipe_clk                1        1        0   125000000          0     0  50000         Y
> > >     usb0_pipe_clk_src                 1        1        0   125000000          0     0  50000         Y
> > >        gcc_usb0_pipe_clk              1        1        0   125000000          0     0  50000         Y
> > >  usb3phy_1_cc_pipe_clk                1        1        0   125000000          0     0  50000         Y
> > >     usb1_pipe_clk_src                 1        1        0   125000000          0     0  50000         Y
> > >        gcc_usb1_pipe_clk              1        1        0   125000000          0     0  50000         Y
> > >
> > > Fixes: 5e09bc51d07b ("arm64: dts: ipq8074: enable USB support")
> > > Signed-off-by: Robert Marko <robimarko@gmail.com>
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > Nevertheless, could you please add .fw_name to these entries in gcc
> > driver (as you did for other clocks in 35dc8e101a8e ("clk: qcom:
> > ipq8074: populate fw_name for all parents")) and add all pipe clocks
> > to the gcc node? This way you can drop clock-output-names from the PHY
> > nodes.
>
> As you noticed they are in the GCC patch already, after the PCI PIPE
> parenting fixes
> are merged I plan to add them to the GCC node to avoid global lookup.

Good! I think the pcie fixes are already in Bjorn's tree. And you
might send the dts fix anyway, in the worst case the driver will just
ignore the DT clocks.


-- 
With best wishes
Dmitry
