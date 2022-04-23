Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82BB450C1F6
	for <lists+linux-clk@lfdr.de>; Sat, 23 Apr 2022 00:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231345AbiDVWBX (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 22 Apr 2022 18:01:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231276AbiDVWBW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 22 Apr 2022 18:01:22 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7EF2303F53
        for <linux-clk@vger.kernel.org>; Fri, 22 Apr 2022 13:44:32 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id e189so10318454oia.8
        for <linux-clk@vger.kernel.org>; Fri, 22 Apr 2022 13:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=HUMQ8dOwWcozf0T8hyC7PrAL47Bqnr3PZuCCA3VDyQ8=;
        b=67m2EolxDI3u9U8jdfMMCm41tCPw6FMxg+fnkdtSbwlJM4k4eP9W3LbDIKh3AhJxs7
         5qZNjt6QYsglpHq/suVtVCLxrzzCpxJGw6rQWPL6JRc9iW6vSWoLtwOQuuZCtwFLVQUO
         H05xbTinKEH6Lwyvg5MdlCVc+AdFGtNC3IAz/SfpNS22x7cR3oyaOuN0UANm6sH146jv
         muw+9aZR2Ey8x+YcFiCoURseMa90IhIXX3VRZaMRIG3sa5EsXDEcFXMcTLG3Qd9S8uxg
         C02xg/sP6xPdLUKEBbrTK5WNBPTvZTEC3wq7NoEjIJqe0VhIBcUGzFpKYwjW3gvhty0d
         xCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=HUMQ8dOwWcozf0T8hyC7PrAL47Bqnr3PZuCCA3VDyQ8=;
        b=kiieHkp214CRiNvQV7vtuh+nq9yjho+31EjfC9/8yfjUu3g6yAN222yJGsSSdVuIfo
         yQFU9zkAo2tSjSJHxO/ex1exW7Rhgv/AqsDhp4kEPF/9xC+eg5Ccb8AcnVnuKT2NU1zX
         Hk+HluBB33iU981WthdfNvkQzNtig3VmcHcp++1UmMu8A3p/Xieozgo4ek+65Z3VFrcs
         foex4tW8qwXh1HmOdzHn11S4UYuoZViiuPYauNp/jhf+/nB0te0fWtxEAf67OalMwsQW
         FfJ7AssfSvtRZ8WfPO8F9KFEbgZ23xRYgXP9+Y25sWPgjgBusOdjzn3QB2HNXFd4HYHt
         d+rA==
X-Gm-Message-State: AOAM532Fg9sfbw0cgN6YtvndNChLziSx5+7fwyFVOdxnDu8HhnotSnTj
        oKT+dxu4P24jDr/W8yOa6erHRuR1Vlc85w==
X-Google-Smtp-Source: ABdhPJz91Vr1VWL78e6GXi1sN4DfrxfIkWJFZuUB5PF2qPCekCsORokaFVPX1JbXifzQAib4CZoXKQ==
X-Received: by 2002:a17:90a:d082:b0:1ca:be58:c692 with SMTP id k2-20020a17090ad08200b001cabe58c692mr18098614pju.238.1650656359441;
        Fri, 22 Apr 2022 12:39:19 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id dw16-20020a17090b095000b001cd4989ff66sm6951168pjb.45.2022.04.22.12.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 12:39:18 -0700 (PDT)
Date:   Fri, 22 Apr 2022 12:39:18 -0700 (PDT)
X-Google-Original-Date: Fri, 22 Apr 2022 12:39:14 PDT (-0700)
Subject:     Re: [PATCH v3 0/9] More PolarFire SoC Fixes for 5.18
In-Reply-To: <20220413075835.3354193-1-conor.dooley@microchip.com>
CC:     mturquette@baylibre.com, sboyd@kernel.org, aou@eecs.berkeley.edu,
        Paul Walmsley <paul.walmsley@sifive.com>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        krzk+dt@kernel.org, daire.mcnamara@microchip.com,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
        conor.dooley@microchip.com
From:   Palmer Dabbelt <palmer@rivosinc.com>
To:     conor.dooley@microchip.com, atulkhare@rivosinc.com
Message-ID: <mhng-185e3a61-0634-4671-adfd-a1cc223920cf@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 13 Apr 2022 00:58:27 PDT (-0700), conor.dooley@microchip.com wrote:
> Hey all,
> After the clock driver for the PolarFire SoC was accepted I started work
> on the onboard RTC & found out that the reference clock for the rtc was
> actually missing from the clock driver.
>
> While restructuring the clock driver to add support for the rtc
> reference, I also noticed that there were some problems with how the FIC
> clocks were being used. The FIC clocks are the cpu side inputs to the
> AXI fabric interconnections & are not the clocks for any peripherals.
>
> This first three patches in this series fixes the problems with the FICs:
> - the fic clocks incorrectly had the AHB clock as their parents
> - the last fic, named differently to the others, had not been set as
>   a critical clock
> - some peripherals on the fabric side were incorrectly using the cpu
>   side fic clocks, resulting in incorrect rates.
>
> The second part of the series fixes the missing rtc reference clock.
> There are three main changes:
> - Changing the reference clock in the dt to the external 125 MHz
>   oscillator rather than using the output of an internal pll. This has
>   the added benefit of not requiring changes to the device tree if this
>   part of the bitstream changes.
> - Adding a new clock into the driver that sits above the existing
>   configurable clocks & has the external reference as a parent. The new
>   clock provides the parent for the AHB/AXI clocks which formerly came
>   from the device tree.
> - Adding the rtc reference clock to the dt bindings, device tree and
>   clock driver at the configurable clock level, alongside AXI and AHB.
>
> I kept series separate from [0] since that's tied to the CONFIG_PM stuff
> & fixes a specific problem.
>
> Changes since v1:
> After speaking with Krzysztof, I have merged the rtc reference changes
> [1] with these fixes for 5.18. This was done since the relevant drivers
> and bindings only arrived in v5.18 & there'll now be no issue with
> breaking the ABI.
> Backwards compatiblity with the device tree from before 5.18 will be
> broken by these changes, but the board did not boot then anyway... If
> that is not okay, please lmk.
>
> The patch renaming sys_base was dropped since that's not a fix.
>
> Version 1 would not apply without [0] & that should be fixed too.
>
> Thanks,
> Conor.
>
> Changes since v2:
> - Wrapped text in dt-binding changes at 80 cols
> - Ordered the clock defines numerically in the binding header
> - Fixed the Fixes tag on the last patch and added the second tag
>
> [0] https://lore.kernel.org/linux-riscv/20220408143646.3693104-1-conor.dooley@microchip.com
> [1] https://lore.kernel.org/linux-riscv/20220411072340.740981-1-conor.dooley@microchip.com
>
> Conor Dooley (9):
>   clk: microchip: mpfs: fix parents for FIC clocks
>   clk: microchip: mpfs: mark CLK_ATHENA as critical
>   riscv: dts: microchip: fix usage of fic clocks on mpfs
>   dt-bindings: clk: mpfs document msspll dri registers
>   dt-bindings: clk: mpfs: add defines for two new clocks
>   dt-bindings: rtc: add refclk to mpfs-rtc
>   clk: microchip: mpfs: re-parent the configurable clocks
>   clk: microchip: mpfs: add RTCREF clock control
>   riscv: dts: microchip: reparent mpfs clocks
>
>  .../bindings/clock/microchip,mpfs.yaml        |  13 +-
>  .../bindings/rtc/microchip,mfps-rtc.yaml      |  15 +-
>  .../dts/microchip/microchip-mpfs-fabric.dtsi  |  16 +-
>  .../microchip/microchip-mpfs-icicle-kit.dts   |   2 +-
>  .../boot/dts/microchip/microchip-mpfs.dtsi    |  10 +-
>  drivers/clk/microchip/clk-mpfs.c              | 191 +++++++++++++++---
>  .../dt-bindings/clock/microchip,mpfs-clock.h  |   5 +-
>  7 files changed, 211 insertions(+), 41 deletions(-)

Thanks.  These generally look good to me, but I don't see acks from 
everyone.  I'm perfectly fine treating these as fixes and taking them 
through the RISC-V tree, but looks like it's mostly clk stuff so

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

in case someone else wants to take it.  I've put these over at 
palmer/riscv-pfsoc-clk but haven't merged that anywhere, I'll hold off 
until at least next week to give everyone time to chime in.

On a somewhat related note, I'm getting some DT schema failures 

    /scratch/riscv-systems-ci-fixes/check/dt_check/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dtb: /: memory@80000000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
            From schema: /home/palmer/.local/lib/python3.8/site-packages/dtschema-2022.3.2-py3.8.egg/dtschema/schemas/memory.yaml
    /scratch/riscv-systems-ci-fixes/check/dt_check/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dtb: /: memory@1000000000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
            From schema: /home/palmer/.local/lib/python3.8/site-packages/dtschema-2022.3.2-py3.8.egg/dtschema/schemas/memory.yaml
    /scratch/riscv-systems-ci-fixes/check/dt_check/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dtb: soc: syscontroller: {'compatible': ['microchip,mpfs-sys-controller'], 'mboxes': [[15, 0]], 'status': ['okay']} should not be valid under {'type': 'object'}
            From schema: /home/palmer/.local/lib/python3.8/site-packages/dtschema-2022.3.2-py3.8.egg/dtschema/schemas/simple-bus.yaml
    
Looks like none of them are new from this patch set, though.  Atul's 
been chasing down various DT schema failures so they might be fixed 
already.
