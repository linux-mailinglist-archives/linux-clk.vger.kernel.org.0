Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD6B11A594
	for <lists+linux-clk@lfdr.de>; Wed, 11 Dec 2019 09:06:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728222AbfLKIGl (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 11 Dec 2019 03:06:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:58576 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726543AbfLKIGk (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 11 Dec 2019 03:06:40 -0500
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 35EA12054F;
        Wed, 11 Dec 2019 08:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576051599;
        bh=aZtYd98mzUkDYBimIJiIk+xpvUxyvOdwk4skO2rZsWU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tRBOLd7GogVABRX6jLstcnMWcS5/AnpxkmChvjpnfYJ61Yl3+pM15HSBu7xDVKBOM
         a0qVMbdC9b8ZZBPDpXgJLlkljluvdJxDZdGVCCmp3uVb/d8nfu8+RAVGvmN0gQ/giB
         dPp6V5vJDVJaPuCvdOKFJu9emxfjAjYrvgrWftO8=
Date:   Wed, 11 Dec 2019 16:06:29 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Leonard Crestez <leonard.crestez@nxp.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com
Subject: Re: [PATCH] clk: imx8qxp-lpcg: Warn against
 devm_platform_ioremap_resource
Message-ID: <20191211080628.GT15858@dragon>
References: <329ac54993d5eb955249d037241a7213faff508f.1575924858.git.leonard.crestez@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <329ac54993d5eb955249d037241a7213faff508f.1575924858.git.leonard.crestez@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Dec 09, 2019 at 10:56:28PM +0200, Leonard Crestez wrote:
> On imx8 the LPCG nodes map entire subsystems and overlap peripherals,
> this means that using devm_platform_ioremap_resource will cause many
> devices to fail to probe including serial ports.
> 
> Well-meaning but boot-breaking patches were posted multiple times so add
> a comment explaining this issue.
> 
> Suggested-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>

Applied, thanks.
