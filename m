Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9F7A2DAC1
	for <lists+linux-clk@lfdr.de>; Wed, 29 May 2019 12:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726372AbfE2K3o (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 29 May 2019 06:29:44 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:49606 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725990AbfE2K3o (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 May 2019 06:29:44 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 073BA25AEEC;
        Wed, 29 May 2019 20:29:42 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 01E11940361; Wed, 29 May 2019 12:29:39 +0200 (CEST)
Date:   Wed, 29 May 2019 12:29:39 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: mstp: Remove error messages on
 out-of-memory conditions
Message-ID: <20190529102939.ssdpktlqldexwgkv@verge.net.au>
References: <20190527123514.7198-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527123514.7198-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, May 27, 2019 at 02:35:14PM +0200, Geert Uytterhoeven wrote:
> pm_clk_create() and pm_clk_add_clk() can fail only when running out of
> memory.  Hence there is no need to print error messages on failure, as
> the memory allocation core already takes care of that.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

