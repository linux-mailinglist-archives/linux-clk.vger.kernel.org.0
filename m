Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41B7931E7AE
	for <lists+linux-clk@lfdr.de>; Thu, 18 Feb 2021 09:55:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbhBRIyV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-clk@lfdr.de>); Thu, 18 Feb 2021 03:54:21 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:38097 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230334AbhBRIu4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 Feb 2021 03:50:56 -0500
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id AF5D83AC661;
        Thu, 18 Feb 2021 08:38:19 +0000 (UTC)
X-Originating-IP: 86.210.203.113
Received: from xps13 (lfbn-tou-1-972-113.w86-210.abo.wanadoo.fr [86.210.203.113])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 6DADB4000F;
        Thu, 18 Feb 2021 08:35:11 +0000 (UTC)
Date:   Thu, 18 Feb 2021 09:35:10 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <shubhrajyoti.datta@gmail.com>,
        Chirag Parekh <chirag.parekh@xilinx.com>
Subject: Re: [PATCH v9 4/7] clk: clock-wizard: Add support for dynamic
 reconfiguration
Message-ID: <20210218093510.1ea35ac3@xps13>
In-Reply-To: <1613623791-4598-5-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1613623791-4598-1-git-send-email-shubhrajyoti.datta@xilinx.com>
        <1613623791-4598-5-git-send-email-shubhrajyoti.datta@xilinx.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Shubhrajyoti,

Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com> wrote on Thu, 18 Feb
2021 10:19:48 +0530:

> The patch adds support for dynamic reconfiguration of clock output rate.
> Output clocks are registered as dividers and set rate callback function
> is used for dynamic reconfiguration.
> 
> Based on the initial work from Chirag.
> 
> Signed-off-by: Chirag Parekh <chirag.parekh@xilinx.com>

The first SoB should match the author.

Either your just did minor changes and keep Chirag's Authorship + SoB
and add your SoB as you already did below, or either use the
Codevelopped tag or if you really change a lot of things you can keep
the authorship and give Chirag credit with a Suggested-by or something
like this.

> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---

Thanks,
Miquèl
