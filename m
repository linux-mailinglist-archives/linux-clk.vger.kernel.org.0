Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4396D116835
	for <lists+linux-clk@lfdr.de>; Mon,  9 Dec 2019 09:32:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727196AbfLIIcW (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 9 Dec 2019 03:32:22 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51134 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727044AbfLIIcW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Dec 2019 03:32:22 -0500
Received: by mail-wm1-f68.google.com with SMTP id p9so14477590wmg.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Dec 2019 00:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=emf4IJEEMsmxfQFP3fayTObEfLJTqttr7F9XFtfzuqY=;
        b=l2RINiniKcey/jhYyNEjboTgQuFh87XyROBMa0gj84/Vm4tnZlbyZamK6aJYwRdYBn
         uqHL+5kmm95wY5dB41OWQXTWCUveOtySqUfhMwfer/v8Zb1TYo9st7wgVs1pPSWwjQnE
         CTWybUczEiNtygy24UTDLkRuDSYBdDwHu6Rw5oEQYbRCuQN3N1sOmM/QgTGJrqYK/+gd
         ZsBs5IBMow3rG8I+aOTopBP+NLYSYP93vryqBdFCNpkC9MIh76Nwq73qdxpBNEwpOy40
         MLrjAHDJQUIoyS8+q75zjNhm3Z0PuAC7sNYZQKTbpnxuI+nQ0TAGdRfv5aoeVP8gz0BD
         SLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=emf4IJEEMsmxfQFP3fayTObEfLJTqttr7F9XFtfzuqY=;
        b=iaUugO7on6gmX+CMMbIEyqEVi7DZ/vA0vUknxd1RcbRduRNGfE1N/g6qS9v9m89nKc
         1Ucpi5SnsAVy2MiBb+rZKQLIty1HXWIwHxZevRW9KR6xMpva1kTD5DjQXOPeerhvRMnx
         GXCF/nTKtnj1lkNaIfYJhMoD1I8c5wSB67jmqMCTse+yWwg3KCVIWldPEzPS5HdgxHJQ
         VHGmo72Mor1irF/p1LfoHgxeYaXmSV5bmeKuLE6ZYz8f1XlAJ3iTEHGQ3rk9YCZyXsND
         A3Baffzx7z/2JbB0vzsMeO6Dp5l5AzK7aMHl1vbRENd8W1Drz/vs1shcAmT7PxRhX6s3
         vJTQ==
X-Gm-Message-State: APjAAAVBVUFVC7Wrm7PQQhYonDlKQQ2KJDG4VRTD+B19zE3KKjYWMYYD
        C7kLy6a1Dd663c+4+SDaNewxfg==
X-Google-Smtp-Source: APXvYqzCeYkH/XjSzuD2xv6U2QTFu/p0/ipUgx0/xb5fgeGV8FOzVH5MhgwTY08LUaCdUwXNjXg2fA==
X-Received: by 2002:a05:600c:2144:: with SMTP id v4mr22522732wml.141.1575880340584;
        Mon, 09 Dec 2019 00:32:20 -0800 (PST)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.gmail.com with ESMTPSA id v188sm13242989wma.10.2019.12.09.00.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 00:32:19 -0800 (PST)
References: <20191208210320.15539-1-repk@triplefau.lt>
User-agent: mu4e 1.3.3; emacs 26.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Remi Pommarel <repk@triplefau.lt>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Yue Wang <yue.wang@Amlogic.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
Subject: Re: [PATCH 0/2] PCI: amlogic: Make PCIe working reliably on AXG platforms
In-reply-to: <20191208210320.15539-1-repk@triplefau.lt>
Date:   Mon, 09 Dec 2019 09:32:18 +0100
Message-ID: <1jpngxew6l.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Sun 08 Dec 2019 at 22:03, Remi Pommarel <repk@triplefau.lt> wrote:

> PCIe device probing failures have been seen on some AXG platforms and were
> due to unreliable clock signal output. Setting HHI_MIPI_CNTL0[26] bit
> solved the problem. After being contacted about this, vendor reported that
> this bit was linked to PCIe PLL CML output.

Thanks for reporting the problem.

As Martin pointed out, the CML outputs already exist in the AXG clock
controller but are handled using HHI_PCIE_PLL_CNTL6. Although
incomplete, it seems to be aligned with the datasheet I have (v0.9)

According to the same document, HHI_MIPI_CNTL0 belong to the MIPI Phy.
Unfortunately bit 26 is not documented

AFAICT, the clock controller is not appropriate driver to deal with this
register/bit

>
> This serie adds a way to set this bit through AXG clock gating logic.
> Platforms having this kind of issue could make use of this gating by
> applying a patch to their devicetree similar to:
>
>                 clocks = <&clkc CLKID_USB
>                         &clkc CLKID_MIPI_ENABLE
>                         &clkc CLKID_PCIE_A
> -                       &clkc CLKID_PCIE_CML_EN0>;
> +                       &clkc CLKID_PCIE_CML_EN0
> +                       &clkc CLKID_PCIE_PLL_CML_ENABLE>;
>                 clock-names = "pcie_general",
>                                 "pcie_mipi_en",
>                                 "pcie",
> -                               "port";
> +                               "port",
> +                               "pll_cml_en";
>                 resets = <&reset RESET_PCIE_PHY>,
>                         <&reset RESET_PCIE_A>,
>                         <&reset RESET_PCIE_APB>;

A few remarks for your future patches:

* You need to document any need binding you introduce:
  It means that there should have been a patch in
  Documentation/devicetree/... before using your newclock name in the
  pcie driver. As Martin pointed out, dt-bindings should be dealt with
  in their own patches

>
>
> Remi Pommarel (2):
>   clk: meson: axg: add pcie pll cml gating

Whenever possible, patches intended for different maintainers should be
sent separately (different series)

>   PCI: amlogic: Use PCIe pll gate when available
>
>  drivers/clk/meson/axg.c                | 3 +++
>  drivers/clk/meson/axg.h                | 2 +-
>  drivers/pci/controller/dwc/pci-meson.c | 5 +++++
>  include/dt-bindings/clock/axg-clkc.h   | 1 +
>  4 files changed, 10 insertions(+), 1 deletion(-)

