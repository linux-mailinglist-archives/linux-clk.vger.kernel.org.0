Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF40D21C0E3
	for <lists+linux-clk@lfdr.de>; Sat, 11 Jul 2020 01:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbgGJXpb (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 10 Jul 2020 19:45:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:47228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726671AbgGJXpa (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 10 Jul 2020 19:45:30 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6F5CB206A1;
        Fri, 10 Jul 2020 23:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594424730;
        bh=TSlabevax9vgsluwWsa9bxwUwSSauvPa6NxNc7de55M=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=xxwyj+ubsvUhVxe1V0srgIlYlIgpf6hVkh/Zssn+LkQaQE9cluP5KYjcYT8Gz+Ubj
         3eHnHHqQwNSnsC64EXZJSRdsZ1BnsaML1kJtShWBNcElf+R104DAZ1sF/czZIQqZIJ
         518uVPapWZ69Imh8JTkhzW3G33hJj4M63bBcPgyA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1594311873-8683-2-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1594311873-8683-1-git-send-email-shubhrajyoti.datta@xilinx.com> <1594311873-8683-2-git-send-email-shubhrajyoti.datta@xilinx.com>
Subject: Re: [PATCH 2/2] clk: zynqmp: Fix a memory leak
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, michal.simek@xilinx.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        git-dev@xilinx.com, linux-clk@vger.kernel.org
Date:   Fri, 10 Jul 2020 16:45:29 -0700
Message-ID: <159442472982.1987609.15250280355379459281@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shubhrajyoti Datta (2020-07-09 09:24:33)
> Fix a memory leak of mux.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Any Fixes: tag?

> ---
>  drivers/clk/zynqmp/clk-mux-zynqmp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
