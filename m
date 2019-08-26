Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91D329CD60
	for <lists+linux-clk@lfdr.de>; Mon, 26 Aug 2019 12:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727376AbfHZKiy (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 26 Aug 2019 06:38:54 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39134 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727692AbfHZKiy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Aug 2019 06:38:54 -0400
Received: by mail-wm1-f65.google.com with SMTP id i63so15322120wmg.4
        for <linux-clk@vger.kernel.org>; Mon, 26 Aug 2019 03:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=Kf8u4CCd/0S9O2So6myGgJK9LXtHBggKOGNILgyNsuQ=;
        b=zQ8qmx05qaOIOKB3nVfxXqNCv+sn45uHFoupchU/B5zmHCN7P03HHPRLrUjbmJmnhx
         IpyiotKwMSMCJbdLA9LfMV32TI6cVrpw+aoiguzXU9TCxD84ovcOUzc/yHq2RzLjkOwh
         V6qOJdCIhgChbe7pPv77ONsJFBRDFa3bl91/LcGbmlZBM/ki7UAsHZzDqDR5Z7AkAkIQ
         e55qpjmV2NWd/xbpvPP3DnV0donLR7jFVICnLZkeFV19/9R2kmIW99MIPIwW8mmLs50T
         /tCRnjIzaS3Ez4vOpUw1ZnZZUCN9Z8QTxRF95FpldE71mQQRFb6fqa51UjkMk84x3r8C
         qxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=Kf8u4CCd/0S9O2So6myGgJK9LXtHBggKOGNILgyNsuQ=;
        b=kgjObByGg6fufCr0Qo6IEuSzz47ugY/4mlon5jJgi/qGuoEGJDIw6eoktPPsiKvF2d
         SDy/NUty9XeENLoIRu0lhlm+JJrtIQbuseL3lJfPxTjtuU07PzCX6B/fUu47Hc5G+W+I
         VL1uFtmUjkoefgGIWnYkSnIMW25PZw15EyG4Zal0maxRtN10IGIZGq2Tw4eFba7bMIsp
         CKLmJGKYinqpVHxYXKMQu1Qz6spdKSCaNiX3PfPa8INSxsAt38VuekAOethollMuBdWG
         JNvOdW0wf8i1UGYXtczypIjY3yOJ+7oiBfa0tvVSX4JrwznnXPZOIaYzeilYEvJWEGKg
         NHuA==
X-Gm-Message-State: APjAAAXBXC7zjV7L4fKTmAfFWdr3FQZTe2yNaF0QRu2hT/RtkUl2mpqK
        OScT8iT1RI6O0ajEUse0u7ytJA==
X-Google-Smtp-Source: APXvYqx71Hht1gZQHsv1/FmSYQIlLLq0ghiFPtdJ3K9r2UYbesJhnRhD20ID9r47y8tLV2cTZB7m2w==
X-Received: by 2002:a7b:c198:: with SMTP id y24mr20738869wmi.131.1566815931702;
        Mon, 26 Aug 2019 03:38:51 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id e11sm32044884wrc.4.2019.08.26.03.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2019 03:38:50 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] 0/6] arm64: meson-sm1: add support for DVFS
In-Reply-To: <20190826072539.27725-1-narmstrong@baylibre.com>
References: <20190826072539.27725-1-narmstrong@baylibre.com>
Date:   Mon, 26 Aug 2019 12:38:49 +0200
Message-ID: <1jblwc6wjq.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon 26 Aug 2019 at 09:25, Neil Armstrong <narmstrong@baylibre.com> wrote:

> Following DVFS support for the Amlogic G12A and G12B SoCs, this serie
> enables DVFS on the SM1 SoC for the SEI610 board.
>
> The SM1 Clock structure is slightly different because of the Cortex-A55
> core used, having the capability for each core of a same cluster to run
> at a different frequency thanks to the newly used DynamIQ Shared Unit.
>
> This is why SM1 has a CPU clock tree for each core and for DynamIQ Shared Unit,
> with a bypass mux to use the CPU0 instead of the dedicated trees.
>
> The DSU uses a new GP1 PLL as default clock, thus GP1 is added as read-only.
>
> The SM1 OPPs has been taken from the Amlogic Vendor tree, and unlike
> G12A only a single version of the SoC is available.
>
> Dependencies:
> - patch 6 is based on the "arm64: meson: add support for SM1 Power Domains" serie,
> 	but is not a strong dependency, it will work without
>
> Changes since v1:
> - exposed GP1, DSU and CPU 1,2,3 clock in patch 1
>
> Neil Armstrong (5):
>   dt-bindings: clk: meson: add sm1 periph clock controller bindings
>   clk: meson: g12a: add support for SM1 GP1 PLL
>   clk: meson: g12a: add support for SM1 DynamIQ Shared Unit clock
>   clk: meson: g12a: add support for SM1 CPU 1, 2 & 3 clocks
>   arm64: dts: meson-sm1-sei610: enable DVFS
>
>  .../bindings/clock/amlogic,gxbb-clkc.txt      |   1 +
>  .../boot/dts/amlogic/meson-sm1-sei610.dts     |  59 +-
>  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    |  69 +++
>  drivers/clk/meson/g12a.c                      | 544 ++++++++++++++++++
>  drivers/clk/meson/g12a.h                      |  24 +-
>  include/dt-bindings/clock/g12a-clkc.h         |   5 +
>  6 files changed, 697 insertions(+), 5 deletions(-)

Applied 1 to 4

Nitpick: two checkpatch warnings regarding 75 char line wrap fixed in place.

>
> -- 
> 2.22.0
