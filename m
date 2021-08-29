Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79A0E3FA8E4
	for <lists+linux-clk@lfdr.de>; Sun, 29 Aug 2021 06:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbhH2E1o (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 29 Aug 2021 00:27:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:44764 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229534AbhH2E1o (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 29 Aug 2021 00:27:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DDD8B608FB;
        Sun, 29 Aug 2021 04:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630211213;
        bh=Vb285kp+zmf7wFywDXzvgbCEOGGzpWQ8A4n2t83hQfU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=l8AD7zoJ4aySWVeBXLID/G2N9QLkV6w9yMKonLNBnyD9qE2aqYSL5jgU3oZ51nw5s
         ggvW77IVf7HF0O4PUTjNdlnyms9+8sVf+qr/1jHzZPOQfVRG0qhg/nHYr1Z//dFoDr
         rrkZZqWGOPvUsVLiI5btdMb8oAPy3Thszk3IWZBu49d6UwHH2HJlRRMkFF8aosvWRe
         EqkvX4+ia7OFi4sO8r3yydFa94XZSF5reqUUBCHDA7vIVAvxrsQFIcTTo52FoHAhv7
         Y5YjXjhnZ/+NV1lzlmrtnNunkjhwBy6y7cT2709iL+xq4smcD+Kfi6RgNyheyIaxNp
         xLAwOMfDI4Y6A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210818065929.12835-2-shubhrajyoti.datta@xilinx.com>
References: <20210818065929.12835-1-shubhrajyoti.datta@xilinx.com> <20210818065929.12835-2-shubhrajyoti.datta@xilinx.com>
Subject: Re: [PATCH 1/3] clk: zynqmp: Check the return type
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, michal.simek@xilinx.com,
        git-dev@xilinx.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-clk@vger.kernel.org
Date:   Sat, 28 Aug 2021 21:26:51 -0700
Message-ID: <163021121167.2676726.10038499902367932099@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shubhrajyoti Datta (2021-08-17 23:59:27)
> Currently the return value of of_clk_add_hw_provider is ignored.
> lets check and return value.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---

Applied to clk-next
