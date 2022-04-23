Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AA3550C62C
	for <lists+linux-clk@lfdr.de>; Sat, 23 Apr 2022 03:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231338AbiDWBou (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 22 Apr 2022 21:44:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbiDWBot (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 22 Apr 2022 21:44:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05EFF1EE8B6;
        Fri, 22 Apr 2022 18:41:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9766061365;
        Sat, 23 Apr 2022 01:41:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F01E6C385A4;
        Sat, 23 Apr 2022 01:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650678114;
        bh=ihPaSFuwN2TjpHaNcek0Q7kKelDbk3E90g7VQV6Eh+k=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ZvPXzBLjqWioededoX7PB/3PILpKzLUO0+7M6hHReYSYMSpKRYNg5pKyRWX7FXCdc
         hg+2CtHIO/ry8wD2MLSxpji4PJggT7rzAkbmT5MZKLy10SUTWRIVAa0mLOxjofbx+s
         VjJrNlZI2DxMiXNNNefSfpRfYmG8ApdLnWoGfNRMJ1vZ0AkyPdWIxNrD7QtS/FTZ8c
         rwvzrvRuaB2V0v+ZSPR9ynhpBnIyKALv3brFVmbzVAIn2CqIQw7Wsv0RmLqJovkebG
         cSULV/g2XZYJOVYwzhDfW6zxDRBeDWW8oTacJgsScsbD5pKfVxPc7Hw0svi/59ArfK
         y3shGZNBppLvQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220413075835.3354193-8-conor.dooley@microchip.com>
References: <20220413075835.3354193-1-conor.dooley@microchip.com> <20220413075835.3354193-8-conor.dooley@microchip.com>
Subject: Re: [PATCH v3 7/9] clk: microchip: mpfs: re-parent the configurable clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Conor Dooley <conor.dooley@microchip.com>
To:     Conor Dooley <conor.dooley@microchip.com>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, aou@eecs.berkeley.edu,
        krzk+dt@kernel.org, mturquette@baylibre.com, palmer@rivosinc.com,
        paul.walmsley@sifive.com, robh+dt@kernel.org
Date:   Fri, 22 Apr 2022 18:41:52 -0700
User-Agent: alot/0.10
Message-Id: <20220423014153.F01E6C385A4@smtp.kernel.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Conor Dooley (2022-04-13 00:58:34)
> Currently the mpfs clock driver uses a reference clock called the
> "msspll", set in the device tree, as the parent for the cpu/axi/ahb
> (config) clocks. The frequency of the msspll is determined by the FPGA
> bitstream & the bootloader configures the clock to match the bitstream.
> The real reference is provided by a 100 or 125 MHz off chip oscillator.
>=20
> However, the msspll clock is not actually the parent of all clocks on
> the system - the reference clock for the rtc/mtimer actually has the
> off chip oscillator as its parent.
>=20
> In order to fix this, add support for reading the configuration of the
> msspll & reparent the "config" clocks so that they are derived from
> this clock rather than the reference in the device tree.
>=20
> Fixes: 635e5e73370e ("clk: microchip: Add driver for Microchip PolarFire =
SoC")
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied to clk-fixes
