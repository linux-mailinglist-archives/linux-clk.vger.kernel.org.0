Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 622C74C9703
	for <lists+linux-clk@lfdr.de>; Tue,  1 Mar 2022 21:33:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238081AbiCAUeZ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 1 Mar 2022 15:34:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238275AbiCAUeX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Mar 2022 15:34:23 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18A663BBEA
        for <linux-clk@vger.kernel.org>; Tue,  1 Mar 2022 12:33:39 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id z7so17301196oid.4
        for <linux-clk@vger.kernel.org>; Tue, 01 Mar 2022 12:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nv20hi1EgpJvENdPchAQG8EYgFtK0fGzCSXZh2umqLc=;
        b=tyPehNBVMCYXtbaogm3igrsHMfbPu9eZ1qxIPRTklXnqKThx2ioKCWsANhJ/FPnv00
         0gueT6iq4OzYrAhoIxdC9BF2xber9omPtoJCcM1JTx7bNVUbVH14HQ8e85LMFcyOPXSf
         GzvNexjhMwy7JfvKZbLhBi8Lv+IJQbvMIh6foEwgRwDziwgkIMPSM5Old12DzEvYOqh/
         5gpboJYRPauUS88wli8dV2ATuBbGtctJmSSD7W3DcIzDQLu3LHsaKfrBnTjwxMjNE7tk
         hHJDlG7a03BCgJYDpkcUSHuLhy6JZdqJbCsehQ66XXTp50cRTeP61kq9oO9LTUnweU9v
         fXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nv20hi1EgpJvENdPchAQG8EYgFtK0fGzCSXZh2umqLc=;
        b=g2dIkiCMfOpCNV3d+qrmWcx6ijEsSnpMZIbbIX/G4xs+R0mxOONWMCNEWu+t1XdPhI
         vCgeIz1lwNYbFd46TNvPb0eqyPCSw2KYMuX/HCP9g1oqUL7iuhcMzzSpyc+w988Zlrfl
         Sg7gJE1AjdsFtGkETUBuBsbEUa91ispoDanusr8gWnbq6oy5Pka4TDcsPDetD7t9UiRt
         tml3H4ScIRtfV+t3HIcFb6+MF8uLkuX0OS3nxvBtn4bS0IyAbzq8RrPuP3qm5gbPT2fm
         FZ140sXRUK2O8BxHggXVzSoUQ3O0ywm5tbHWTQwBQq5NsvlOD0c4UC8+nOgYgwLAiU5C
         sJOg==
X-Gm-Message-State: AOAM5301PS9q3QHetmpYVa4Nh7RxCsAxYBSCP9gGV33vE/ZNtZylxowC
        RE8OcpRL2nXldBGpzxOLHygOSWGH+7xdRWMQyQ1LFATDbnkp6g==
X-Google-Smtp-Source: ABdhPJwhxniT9wX1lySM6m5jkE3sPq04lJi9KArDKyxFrd+g4oYD6tx4cZ64xzDuKwkyC2dAK6s6goMgMusE2o2rhMw=
X-Received: by 2002:a05:6808:30a3:b0:2d5:2019:97ac with SMTP id
 bl35-20020a05680830a300b002d5201997acmr14869181oib.40.1646166818389; Tue, 01
 Mar 2022 12:33:38 -0800 (PST)
MIME-Version: 1.0
References: <20220126221725.710167-1-bhupesh.sharma@linaro.org>
 <20220126221725.710167-6-bhupesh.sharma@linaro.org> <YfHiQYkeQYwjl3G7@lunn.ch>
In-Reply-To: <YfHiQYkeQYwjl3G7@lunn.ch>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Wed, 2 Mar 2022 02:03:27 +0530
Message-ID: <CAH=2Nty_=ER4Zihw1fF2z9gacpeFWnOExRT8q2VEKsdOBi3D+w@mail.gmail.com>
Subject: Re: [PATCH 5/8] arm64: dts: qcom: sa8155p-adp: Enable ethernet node
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, agross@kernel.org, sboyd@kernel.org,
        tdas@codeaurora.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, bjorn.andersson@linaro.org,
        davem@davemloft.net, netdev@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Andrew,

Sorry for the late reply.

On Thu, 27 Jan 2022 at 05:37, Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +&ethernet {
> > +     status = "okay";
> > +
> > +     snps,reset-gpio = <&tlmm 79 GPIO_ACTIVE_LOW>;
> > +     snps,reset-active-low;
> > +     snps,reset-delays-us = <0 11000 70000>;
> > +
> > +     snps,ptp-ref-clk-rate = <250000000>;
> > +     snps,ptp-req-clk-rate = <96000000>;
> > +
> > +     snps,mtl-rx-config = <&mtl_rx_setup>;
> > +     snps,mtl-tx-config = <&mtl_tx_setup>;
> > +
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&ethernet_defaults>;
> > +
> > +     phy-handle = <&rgmii_phy>;
> > +     phy-mode = "rgmii";
>
> Where are the rgmii delays being added for this board?

I am not sure if I am missing something, but I don't see any rgmii tx
or rx delay dts properties for the dwmac-qcom-ethqos driver (see [1]
and [2]).

I see that some stmmac drivers (for e.g.
drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c), do define and use
dts properties that define the delays (for e.g.
'allwinner,tx-delay-ps'), but I cannot find something equivalent for
'dwmac-qcom-ethqos.c'.

[1]. Documentation/devicetree/bindings/net/qcom,ethqos.txt
[2]. Documentation/devicetree/bindings/net/snps,dwmac.yaml

Regards,
Bhupesh
