Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5820520B8DE
	for <lists+linux-clk@lfdr.de>; Fri, 26 Jun 2020 20:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbgFZS6Y (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 26 Jun 2020 14:58:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:47734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725283AbgFZS6Y (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 26 Jun 2020 14:58:24 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E773420836;
        Fri, 26 Jun 2020 18:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593197904;
        bh=TGfEfT04MJtyB6NlAmXR6ddfNHAjn2Jz58o9zj04LPQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Ffs/k8uGO0BMvavrGsn0anevAbhJNpMoR2Vm+8dfTKQs5l6oKwb37H1G6dOdrmfN7
         rS7KMQbj8CAHv2cA0Qj4yl1/R3+uLRHOc/J0q86BEEN1iuJ127CG95QeJNkm/+AY6V
         N+SDwLsXjRVXPux87TG2wwV6B6SNjtTCwwdascvE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200626112513.90816-1-maxime@cerno.tech>
References: <20200626112513.90816-1-maxime@cerno.tech>
Subject: Re: [PATCH] clk: bcm: dvp: Add missing module informations
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>
To:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Date:   Fri, 26 Jun 2020 11:58:23 -0700
Message-ID: <159319790323.62212.8326522252296969810@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2020-06-26 04:25:13)
> The driver for the DVP controller in the BCM2711 was missing the MODULE_*
> macros resulting in a modpost warning at compilation.
>=20
> Fixes: 1bc95972715a ("clk: bcm: Add BCM2711 DVP driver")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Applied to clk-next
