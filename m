Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B69C687AC9
	for <lists+linux-clk@lfdr.de>; Fri,  9 Aug 2019 15:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406742AbfHINC4 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 9 Aug 2019 09:02:56 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37339 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726273AbfHINC4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Aug 2019 09:02:56 -0400
Received: by mail-wr1-f65.google.com with SMTP id b3so5789300wro.4
        for <linux-clk@vger.kernel.org>; Fri, 09 Aug 2019 06:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=guKBWWb3eeZ7l9sjmmrFhL2DHqTLBp7eL7U+EUACDM8=;
        b=Xjg2ACyHEuYzp7VVPyYXDDOpLZ7hCP/FwuXUsYIVKWH7tM0BC7WOlwO7zKUjhYotVP
         rHGLALHOhALV6DiB2heE8wKNPFy6F/JLb1mOJg8mfJV4pN3jzj2GIc5OOISpmByP0f9l
         wysMSu1etTSz9InGf+eX9NjVFvEiji/0GfFMni4Wp1A7v+duNuFbkHfqvADKqI589VDr
         R2iezcgxY2AGfVSmA2YqjtQKLCdYh3EU2LFVgr+pz9+KM0dNG/94LYvjCp62k0ny+gmJ
         5BallfcItdto7cNXHWjDaU/XR7ykQadkqJPsMKJsw9lyk73fUcJ4CtvCc+IJQjVnot3M
         Lz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=guKBWWb3eeZ7l9sjmmrFhL2DHqTLBp7eL7U+EUACDM8=;
        b=LLkSR1ugmm5WeUsIvyWxI1zrmPp7x1++bzeipOFkwZe7zlYLDfnp2LO1jxTFD4RlPG
         1TFS9TnsQon61O6qItjMwQRxx4HvG4msN0J5fukTJ+r44G1YbBYn0QcdA3gJgJEqbZT/
         8dbDQQFFRaEQiTcWZEFmB7HD2N+vzYmlEnJ8TZ+3ZWFA9959lB7szU8beYSbwLobxyi2
         1svy1qD9Ip5uqD8hOVJW6ZED2Fq7RBUutWXQx7lnu8ql+8i7SYLteLipN2EQVhPZ5oVK
         IA3lftiBDGhdErrLezU1BGD56Re4/TCU/o7XNcpTI1jVbwpKXkvKIWv4n5K+Wqr4nsrS
         wVYw==
X-Gm-Message-State: APjAAAUc1hi+I68B6AcRjqlZoMGR2D/K+6lLVA2tWUzf+YsOmolEcrfL
        Ui0aHjNSag6oBlDaj23/OSiz6w==
X-Google-Smtp-Source: APXvYqxUWEqrAbLvbnYlAsqu5B1nR64GqnOYDQyeEk0f7fVfQpAONB4B8gK0T4HcpGUquzK6j54zXg==
X-Received: by 2002:adf:e790:: with SMTP id n16mr23176826wrm.120.1565355773854;
        Fri, 09 Aug 2019 06:02:53 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id t24sm7932983wmj.14.2019.08.09.06.02.52
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 06:02:53 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>, sboyd@kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/4] clk: meson: g12a: add support for DVFS
In-Reply-To: <7hzhkje4ov.fsf@baylibre.com>
References: <20190731084019.8451-1-narmstrong@baylibre.com> <7hzhkje4ov.fsf@baylibre.com>
Date:   Fri, 09 Aug 2019 15:02:52 +0200
Message-ID: <1jy302o5j7.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu 08 Aug 2019 at 14:18, Kevin Hilman <khilman@baylibre.com> wrote:

> Neil Armstrong <narmstrong@baylibre.com> writes:
>
>> The G12A/G12B Socs embeds a specific clock tree for each CPU cluster :
>> cpu_clk / cpub_clk
>> |   \- cpu_clk_dyn
>> |      |  \- cpu_clk_premux0
>> |      |        |- cpu_clk_postmux0
>> |      |        |    |- cpu_clk_dyn0_div
>> |      |        |    \- xtal/fclk_div2/fclk_div3
>> |      |        \- xtal/fclk_div2/fclk_div3
>> |      \- cpu_clk_premux1
>> |            |- cpu_clk_postmux1
>> |            |    |- cpu_clk_dyn1_div
>> |            |    \- xtal/fclk_div2/fclk_div3
>> |            \- xtal/fclk_div2/fclk_div3
>> \ sys_pll / sys1_pll
>>
>> This patchset adds notifiers on cpu_clk / cpub_clk, cpu_clk_dyn,
>> cpu_clk_premux0 and sys_pll / sys1_pll to permit change frequency of
>> the CPU clock in a safe way as recommended by the vendor Documentation
>> and reference code.
>>
>> This patchset :
>> - introduces needed core and meson clk changes
>> - adds the clock notifiers
>>
>> Dependencies:
>> - None
>
> nit: this doesn't apply to v5.3-rc, but appears to apply on
> clk-meson/v5.4/drivers, so it appears to be dependent on the cleanups
> from Alex.

Indeed, Applied on top of this.

>
> Kevin
