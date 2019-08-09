Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9B87881B8
	for <lists+linux-clk@lfdr.de>; Fri,  9 Aug 2019 19:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436913AbfHIRze (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 9 Aug 2019 13:55:34 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37615 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436783AbfHIRze (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Aug 2019 13:55:34 -0400
Received: by mail-pl1-f195.google.com with SMTP id b3so45294690plr.4
        for <linux-clk@vger.kernel.org>; Fri, 09 Aug 2019 10:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=k0JW1MLLNsJwJlBlpJuuU0x2nZPPO+9mm49FYZVazao=;
        b=OA/UGs56YQC+yyIr42CyZFxmzgMazL51eytKigu93E+h3M3jx1SUQiWiF2xWk/IvJc
         Q2jev5fwjGsrjHCQYryT6wDWbu5un0fcb5sdT8qg/CF0brDZK8w3+cZX9toQy9nepy2n
         syvs8gglTWIuvi3BOXS8JqMrhG9URrL7AtZtNZH9xaxgTvcGU4ewWmf/aBrNKiC3sB0R
         1hyJCFehJSlr9sDErNnlBchuHyiv3Znqbg/Vjpmuq3XjjantHGUcH1i5za2dSzi7pl6K
         WJh1lWbPp+pxypCQx/oWGviqfHxV5K2wqQT3iP9DbAc3Zi+c1FVe/YKm/Y4l0+as8B6Y
         Ii1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=k0JW1MLLNsJwJlBlpJuuU0x2nZPPO+9mm49FYZVazao=;
        b=MHkPq6l2gu8CktV/lDJxo1qhojvdaZuku5ahMnBQ3pZ0JbbbY4v1c08TyfYoqxUrKR
         AvYwsSHZAV3wVPS5ySMsEjYyB+CDtPuXNxFPelMldY241wM2qh5hBbWb7QScchDQQCM2
         OkkRXNpfXSPKv2LOkKvK0Ok9efecnYkw/Uw2a5y7dZqwx961VdCWqHaItVhezORVcSbg
         lUC8fxKmtmlbGVEP/pM/1IOj2XUDAJDUeNW0Kc6ECW8b95Y+jrSSFCWXRi7yJesKQxfF
         Ox8jvubq8Axm05lkcQ5SFO+dkshF1okBn7rxpamleYDtYp81Oeb7j3rXvTE3VmffpMjW
         Q/qA==
X-Gm-Message-State: APjAAAW3pTYmUeaNLY5EMwAzTGZmHATpKI0OJuq1HNyieyixAz71ZFps
        bQ/vPPPdWwIhDpAHili3Of92YQ==
X-Google-Smtp-Source: APXvYqysFBcmJohUVIoX2xKUnTFNTQhCkCVi2y06fMeHjJJpEKticMBmoCDL0iUgxQ747LXHcXRg/g==
X-Received: by 2002:a17:902:6b81:: with SMTP id p1mr20019532plk.91.1565373333064;
        Fri, 09 Aug 2019 10:55:33 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:b873:707a:e893:cdb3])
        by smtp.gmail.com with ESMTPSA id i15sm103848714pfd.160.2019.08.09.10.55.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Aug 2019 10:55:32 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>, sboyd@kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/4] clk: meson: g12a: add support for DVFS
In-Reply-To: <1jy302o5j7.fsf@starbuckisacylon.baylibre.com>
References: <20190731084019.8451-1-narmstrong@baylibre.com> <7hzhkje4ov.fsf@baylibre.com> <1jy302o5j7.fsf@starbuckisacylon.baylibre.com>
Date:   Fri, 09 Aug 2019 10:55:30 -0700
Message-ID: <7h8ss24419.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> On Thu 08 Aug 2019 at 14:18, Kevin Hilman <khilman@baylibre.com> wrote:
>
>> Neil Armstrong <narmstrong@baylibre.com> writes:
>>
>>> The G12A/G12B Socs embeds a specific clock tree for each CPU cluster :
>>> cpu_clk / cpub_clk
>>> |   \- cpu_clk_dyn
>>> |      |  \- cpu_clk_premux0
>>> |      |        |- cpu_clk_postmux0
>>> |      |        |    |- cpu_clk_dyn0_div
>>> |      |        |    \- xtal/fclk_div2/fclk_div3
>>> |      |        \- xtal/fclk_div2/fclk_div3
>>> |      \- cpu_clk_premux1
>>> |            |- cpu_clk_postmux1
>>> |            |    |- cpu_clk_dyn1_div
>>> |            |    \- xtal/fclk_div2/fclk_div3
>>> |            \- xtal/fclk_div2/fclk_div3
>>> \ sys_pll / sys1_pll
>>>
>>> This patchset adds notifiers on cpu_clk / cpub_clk, cpu_clk_dyn,
>>> cpu_clk_premux0 and sys_pll / sys1_pll to permit change frequency of
>>> the CPU clock in a safe way as recommended by the vendor Documentation
>>> and reference code.
>>>
>>> This patchset :
>>> - introduces needed core and meson clk changes
>>> - adds the clock notifiers
>>>
>>> Dependencies:
>>> - None
>>
>> nit: this doesn't apply to v5.3-rc, but appears to apply on
>> clk-meson/v5.4/drivers, so it appears to be dependent on the cleanups
>> from Alex.
>
> Indeed, Applied on top of this.
>

Please let me know when you have a stable tag for this.  I wont' be able
to apply the odroid-n2 DVFS patch until I have this.

Kevin

