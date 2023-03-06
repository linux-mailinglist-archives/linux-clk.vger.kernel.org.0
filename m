Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4AB76ACF00
	for <lists+linux-clk@lfdr.de>; Mon,  6 Mar 2023 21:18:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbjCFUSD (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 6 Mar 2023 15:18:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbjCFUSB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Mar 2023 15:18:01 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB7771ADF1
        for <linux-clk@vger.kernel.org>; Mon,  6 Mar 2023 12:17:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0F8F560F31
        for <linux-clk@vger.kernel.org>; Mon,  6 Mar 2023 20:17:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE70C4339E;
        Mon,  6 Mar 2023 20:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678133877;
        bh=ovaisSO9ZlCn6dh9S+udG+WRrE7AKHP3BafUX8BrrPo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Ah7Ecli74vrlB34dEIVxVHICsXEet2SnJBv+SdUOYtPZ/cgcruoAmn9dNai7YCl/p
         NahoL79aeJpxxe/rcQWPv6wxGPneZWGK4RIFXixY7yb/Ac15lR8pbj8cgBYub/SCKJ
         65vLvgqZAg3bTjO8JweRm/EUCxqbbLUzd4FcG668nvVHx25Glv2D73y9mKpp6Yn2Xi
         7DNlG7c1WlRpGHMDR4Gb22cfOFr8DI7QZTV09i97SR+LNuzfXF6ql4Tu47gHI7B7o6
         /eVBClPmN0oKQP9gPPcH82jNpEdMyMvcKcfKdscCeUacDSWunCAiLlwOa4HOfCqVek
         et5vySU3s+hXg==
Message-ID: <aeb088d8b7bec8929c7c9e9539a0b187.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230222124610.257101-1-conor.dooley@microchip.com>
References: <20230222124610.257101-1-conor.dooley@microchip.com>
Subject: Re: [PATCH] MAINTAINERS: add missing clock driver coverage for Microchip FPGAs
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        linux-clk@vger.kernel.org, daire.mcnamara@microchip.com,
        linux-riscv@lists.infradead.org
To:     Conor Dooley <conor.dooley@microchip.com>,
        Conor Dooley <conor@kernel.org>
Date:   Mon, 06 Mar 2023 12:17:53 -0800
User-Agent: alot/0.10
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Conor Dooley (2023-02-22 04:46:11)
> When the CCC support was added, the clock binding coverage was
> converted to a regex in commit 71c8517e004b ("MAINTAINERS: update
> polarfire soc clock binding"), but the coverage for the clock drivers
> themselves was not updated. Rectify that now.
>=20
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied to clk-fixes
