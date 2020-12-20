Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0662D2DF690
	for <lists+linux-clk@lfdr.de>; Sun, 20 Dec 2020 19:46:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727236AbgLTSqb (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 20 Dec 2020 13:46:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:34504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726901AbgLTSqb (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 20 Dec 2020 13:46:31 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608489951;
        bh=vm23LHAI0H90cZFpmGash+h2lCh42vixofdr0QGQRFI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=HoGZVcsBjKM88NZ/qNaMRG7SNoDt08sepa6xwUWS/RfrQy4GnUq7CMVZXcsvHMpqs
         egrLkFMIiFeIz+nb0OFtA2gOr19yPcZIN2Pkf8rMq/AfviMvV1F3UYURa/OqqDr1L/
         gJpKoyZgNYUKdVToU0qBaDZV5Dua0emM5YjJxpQ0mtJcxg2Ap7Q8MIw1Vd+Q6vCpQI
         mZ3RPcbltu1fZPzvgmKuOV+AK/XIexvE+KthSt4Ado1O7M5xsA3tHoqyAuNJPNBXxz
         aF/8+y/tQ6sEfuF0n1/PopLowRhH6pd7ubrpsnDL32Row3b/YnJc3LRRCxxcTuL89s
         9qXvQtGszjTpQ==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201220085725.19545-3-damien.lemoal@wdc.com>
References: <20201220085725.19545-1-damien.lemoal@wdc.com> <20201220085725.19545-3-damien.lemoal@wdc.com>
Subject: Re: [PATCH 2/2] dt-binding: clock: Document canaan,k210-clk bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>
To:     Damien Le Moal <damien.lemoal@wdc.com>, linux-clk@vger.kernel.org
Date:   Sun, 20 Dec 2020 10:45:49 -0800
Message-ID: <160848994970.1580929.15823224941282222952@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Damien Le Moal (2020-12-20 00:57:25)
> Document the device tree bindings of the Canaan Kendryte K210 SoC clock
> driver in Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml.
> The header file include/dt-bindings/clock/k210-clk.h is modified to
> include the complete list of IDs for all clocks of the SoC.
>=20
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
