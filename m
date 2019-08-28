Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A594B9FCA5
	for <lists+linux-clk@lfdr.de>; Wed, 28 Aug 2019 10:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbfH1ILV (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 28 Aug 2019 04:11:21 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41041 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbfH1ILU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Aug 2019 04:11:20 -0400
Received: by mail-wr1-f66.google.com with SMTP id j16so1479517wrr.8
        for <linux-clk@vger.kernel.org>; Wed, 28 Aug 2019 01:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=eqxGNYrdtuK3SqiJCuvuQ/MzG5G751K98+gYpAVutqc=;
        b=P80buuQWsphNP6jREPV9Yws4dRQ7P0oOQLJevgEYYwLT3PHrJvQdpfP7m+z1ZM01SX
         TWLR2nOrqbxu04cjxyj+H2VurQ5K9D/lo0/O75yOHfKlwPEpZx+6Nspl5XSs0Z6aGXTF
         f0QtyxLe9BkWjANhgwOmPIjQ97xARayjbVQpMikUPIeMf/hsWtG+rfkGXFk+q4//IfW9
         gRixhJmfDRLDOMtSkF+qnsNAf58ljCf/dWMYOA57HhwIz9PYKbSejKGuZIECWCYjJtH9
         7kXYTDEnAQfd4Yo1+s0gYpy9i0ESORwXIN6r3mfMTNpNo5GzbRhLAb6RBzOL0dczg+lc
         JF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=eqxGNYrdtuK3SqiJCuvuQ/MzG5G751K98+gYpAVutqc=;
        b=IBxbNMvzPHE880c5G5Pm+CvT27qDDfRXEg1Pl/gNUYlMvqQxXyOZqmBdRYHvycLlMS
         /lgtcYEtp8oA0JQBoOuKhnlQIpSzglJrpCxSn+JwV7IZDRzpevof0iV31+IaJe0jGscq
         2yvxdvD/RXWQhUrMAtcS5pQhttqZ7WkyPr5Q7y93peQ2nxZth+oj6N1zhMTRBjqcPXFX
         Zzdbr6urHqvHJh/wsfyXqkDHhf945CJsy/+kMyzL/ciTui1oI4Jb2v8EjjwjwgresOwV
         /e7rsL7/igJ8oRlbWmHQoCA+gk0ZxJMNWw1L/EG+rF5LYHz3USngeaSfI2z33JbJZe5f
         Qlbw==
X-Gm-Message-State: APjAAAXu/TOXAiw+vEIvOu/QjTdml9cHB/nC1Ib1t9dlXD1Q5IylDWRd
        iH82E9pT4QTpvabDKH9xq6hmgA==
X-Google-Smtp-Source: APXvYqzwX8FTlhdjUpZFriJLF7P3vR+CknbqtKPsxaLV3l7qvZqJ+ykNQCGzZRQgUdNj9dWbhLJxPw==
X-Received: by 2002:adf:ea51:: with SMTP id j17mr3193282wrn.184.1566979878558;
        Wed, 28 Aug 2019 01:11:18 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id d17sm2668811wre.27.2019.08.28.01.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2019 01:11:17 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] 0/6] arm64: meson-sm1: add support for DVFS
In-Reply-To: <7h1rx6uti8.fsf@baylibre.com>
References: <20190826072539.27725-1-narmstrong@baylibre.com> <1jblwc6wjq.fsf@starbuckisacylon.baylibre.com> <7h8srexw1i.fsf@baylibre.com> <7h1rx6uti8.fsf@baylibre.com>
Date:   Wed, 28 Aug 2019 10:11:16 +0200
Message-ID: <1jo909ogkb.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue 27 Aug 2019 at 15:35, Kevin Hilman <khilman@baylibre.com> wrote:

> Kevin Hilman <khilman@baylibre.com> writes:
>
>> Jerome Brunet <jbrunet@baylibre.com> writes:
>>
>>> On Mon 26 Aug 2019 at 09:25, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>>
>>>> Following DVFS support for the Amlogic G12A and G12B SoCs, this serie
>>>> enables DVFS on the SM1 SoC for the SEI610 board.
>>>>
>>>> The SM1 Clock structure is slightly different because of the Cortex-A55
>>>> core used, having the capability for each core of a same cluster to run
>>>> at a different frequency thanks to the newly used DynamIQ Shared Unit.
>>>>
>>>> This is why SM1 has a CPU clock tree for each core and for DynamIQ Shared Unit,
>>>> with a bypass mux to use the CPU0 instead of the dedicated trees.
>>>>
>>>> The DSU uses a new GP1 PLL as default clock, thus GP1 is added as read-only.
>>>>
>>>> The SM1 OPPs has been taken from the Amlogic Vendor tree, and unlike
>>>> G12A only a single version of the SoC is available.
>>>>
>>>> Dependencies:
>>>> - patch 6 is based on the "arm64: meson: add support for SM1 Power Domains" serie,
>>>> 	but is not a strong dependency, it will work without
>>>>
>>>> Changes since v1:
>>>> - exposed GP1, DSU and CPU 1,2,3 clock in patch 1
>>>>
>>>> Neil Armstrong (5):
>>>>   dt-bindings: clk: meson: add sm1 periph clock controller bindings
>>>>   clk: meson: g12a: add support for SM1 GP1 PLL
>>>>   clk: meson: g12a: add support for SM1 DynamIQ Shared Unit clock
>>>>   clk: meson: g12a: add support for SM1 CPU 1, 2 & 3 clocks
>>>>   arm64: dts: meson-sm1-sei610: enable DVFS
>>>>
>>>>  .../bindings/clock/amlogic,gxbb-clkc.txt      |   1 +
>>>>  .../boot/dts/amlogic/meson-sm1-sei610.dts     |  59 +-
>>>>  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    |  69 +++
>>>>  drivers/clk/meson/g12a.c                      | 544 ++++++++++++++++++
>>>>  drivers/clk/meson/g12a.h                      |  24 +-
>>>>  include/dt-bindings/clock/g12a-clkc.h         |   5 +
>>>>  6 files changed, 697 insertions(+), 5 deletions(-)
>>>
>>> Applied 1 to 4
>>
>> Will there be a stable tag I can use for that so I can apply patch 5?
>
> Ah, I should've finished reading the list before asking.  I now see your
> clock PR.  I'll use this tag[1] unless there's a different one I should
> use.

I just pushed clk-meson-dt-v5.4-3 for you, with dt changes only.

>
> Kevin
>
> [1] git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.4-2
