Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B1FB31B29E
	for <lists+linux-clk@lfdr.de>; Sun, 14 Feb 2021 22:04:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbhBNVC4 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 14 Feb 2021 16:02:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:51224 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229642AbhBNVCw (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 14 Feb 2021 16:02:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4518664E4E;
        Sun, 14 Feb 2021 21:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613336532;
        bh=fbNNdH+cmx0C4+AyuHbbSsUtElMRP1OPzEeeeLRapCo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=k4GEmK4deH8xxDE7ia9aR2XKTybTgY1LdpyZjBb+wI63dny37X/dF8hNp2RdImT0w
         4V4JTodO+oVvBhKgFweRk5KUiM5dDb18rRzYU4jKbcoAsfiu32ifFIzroLofsnvTj/
         7wYE3CVXWfmE/2nKxYMF8n5BoIVz2MXnJ8P+/uOrI1n/Ge+I2gNcPE0m6b87NgMwTV
         uWguEVQdRH+6TujQS6GozMrCDk1zqps2LMUxNW7CQ2Gr3DQA8mVyORr3DnFnsOXRbj
         cyOoskhZuvLYSY8VHonIfBUAgdCMP9kG5A5jvSt9iDa69awF9ixr+MbDA4mPo7ZrG1
         iSWxqoD+bRulw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210125142513.3919014-1-wasim.khan@oss.nxp.com>
References: <20210125142513.3919014-1-wasim.khan@oss.nxp.com>
Subject: Re: [PATCH] clk: qoriq: use macros to generate pll_mask
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Wasim Khan <wasim.khan@nxp.com>
To:     V.Sethi@nxp.com, Wasim Khan <wasim.khan@oss.nxp.com>,
        mturquette@baylibre.com
Date:   Sun, 14 Feb 2021 13:02:11 -0800
Message-ID: <161333653103.1254594.2877661434623451431@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Wasim Khan (2021-01-25 06:25:13)
> From: Wasim Khan <wasim.khan@nxp.com>
>=20
> Use macros to generate pll_mask to make code
> more readable.
>=20
> Signed-off-by: Wasim Khan <wasim.khan@nxp.com>
> ---

Applied to clk-next
