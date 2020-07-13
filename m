Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7004F21C0E2
	for <lists+linux-clk@lfdr.de>; Sat, 11 Jul 2020 01:45:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbgGJXpS (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 10 Jul 2020 19:45:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:47148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726671AbgGJXpR (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 10 Jul 2020 19:45:17 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8400F206A1;
        Fri, 10 Jul 2020 23:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594424717;
        bh=IeQ0jyzRyFVsFVC5+B1UPmsShd8pc123/IAnSaCDInk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=0M/92yTIJRX2QnhYZwLchQ+8TlcosRUVYon4L7iaA4YS5fVCr4mMzJqvuZrlHjABX
         jM9sgmTtT9HvmfmygpFIjed2hWXMAMKLcldu2kQU/bY6tSYCORr00OY2f4EawsdTAo
         HmXNo/wNnhgEuQ2a8Gy1HQDOy62SYDFvc86XEUjE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1594311873-8683-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1594311873-8683-1-git-send-email-shubhrajyoti.datta@xilinx.com>
Subject: Re: [PATCH 1/2] clk: zynqmp: Check the return type
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, michal.simek@xilinx.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        git-dev@xilinx.com, linux-clk@vger.kernel.org
Date:   Fri, 10 Jul 2020 16:45:16 -0700
Message-ID: <159442471685.1987609.7656324191414409296@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shubhrajyoti Datta (2020-07-09 09:24:32)
> Currently the return value of of_clk_add_hw_provider is ignored.

Write of_clk_add_hw_provider() to indicate it's a function.

> lets check and return value.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
