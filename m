Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8CD6186113
	for <lists+linux-clk@lfdr.de>; Mon, 16 Mar 2020 01:57:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729326AbgCPA5Q (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 15 Mar 2020 20:57:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:53604 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729315AbgCPA5Q (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 15 Mar 2020 20:57:16 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 34375205C9;
        Mon, 16 Mar 2020 00:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584320235;
        bh=3piP5pwtf+r7deloTsJap8LnB9s6iAaXgkUy9VghkTk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rr1rGYjoFDj9IDMh/8RIw+gZbJ37SB9uE87PoOATmk/1vTsIEvFsn/vy4LdYKEDzr
         52Jnymov9DMhIjn+39YU6uDNLUHJLEhuFau2egWy08AdJOCOEprypCsDpnSFUdjovR
         oZtlOwczAsb2ePAGMhHGSNbZps9VhKQ1jJQX9xJE=
Date:   Mon, 16 Mar 2020 08:57:11 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>, linux-imx@nxp.com,
        kernel@pengutronix.de, Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: imx7d: Add PXP clock
Message-ID: <20200316005710.GG17221@dragon>
References: <20200309161709.30982-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200309161709.30982-1-laurent.pinchart@ideasonboard.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Mar 09, 2020 at 06:17:09PM +0200, Laurent Pinchart wrote:
> The PXP has a single CCGR clock gate, gating both the IPG_CLK_ROOT and
> the MAIN_AXI_CLK_ROOT. Add a single clock to cover both.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Applied, thanks.
