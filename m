Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCCD41E1E3C
	for <lists+linux-clk@lfdr.de>; Tue, 26 May 2020 11:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731749AbgEZJTV (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 26 May 2020 05:19:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:57572 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731600AbgEZJTU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 26 May 2020 05:19:20 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8A7C82073B;
        Tue, 26 May 2020 09:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590484760;
        bh=pQ9fSIsd2546ytSpDQuQx2cfrsXYFihGA5BoJ2QU+ds=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=n+3mDJ0XDwFUiVHYZkKbTC2uE5yIjCtnlRYbS8jwqSCDc7Cui5pUHoUegUZePsW4s
         WYWFddgcOpEBwGbXLF71WExMKCgY+mOfSOpeozhUTOWCMV8y+uE4U2O1rnDSa+oHvG
         LIzJVsrejlOYQFvW4u31p/rSDKJa9NMjmAPjb++4=
Date:   Tue, 26 May 2020 10:19:17 +0100
From:   Mark Brown <broonie@kernel.org>
To:     "dillon.minfei@gmail.com" <dillon.minfei@gmail.com>,
        linus.walleij@linaro.org
Cc:     linux-stm32@st-md-mailman.stormreply.com,
        linux-spi@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <1590378348-8115-1-git-send-email-dillon.minfei@gmail.com>
References: <1590378348-8115-1-git-send-email-dillon.minfei@gmail.com>
Subject: Re: [PATCH v5 0/8] Enable ili9341 and l3gd20 on stm32f429-disco
Message-Id: <159048475756.7363.2129939912077382888.b4-ty@kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 25 May 2020 11:45:40 +0800, dillon.minfei@gmail.com wrote:
> V5's update based on Mark Brown's suggestion, use 'SPI_MASTER_MUST_RX'
> for SPI_SIMPLEX_RX mode on stm32 spi controller.
> 
> V5:
> 1 instead of add send dummy data out under SIMPLEX_RX mode,
>    add flags 'SPI_CONTROLLER_MUST_TX' for stm32 spi driver
> 2 bypass 'SPI_CONTROLLER_MUST_TX' and 'SPI_CONTROLLER_MUST_RX' under
> 'SPI_3WIRE' mode
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] spi: stm32: Add 'SPI_SIMPLEX_RX', 'SPI_3WIRE_RX' support for stm32f4
      commit: 61367d0b8f5edf5146059ba8b79ce4e4485340b2
[2/2] spi: flags 'SPI_CONTROLLER_MUST_RX' and 'SPI_CONTROLLER_MUST_TX' can't be coexit with 'SPI_3WIRE' mode
      commit: aee67fe879e5030a2f5e1d9af3cb5b2a1027e78a

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
