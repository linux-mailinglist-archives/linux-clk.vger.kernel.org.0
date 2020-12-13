Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A45C02D8BA1
	for <lists+linux-clk@lfdr.de>; Sun, 13 Dec 2020 06:45:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730067AbgLMFoq (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 13 Dec 2020 00:44:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:46268 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727865AbgLMFoq (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 13 Dec 2020 00:44:46 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607838245;
        bh=aiuaDfzwVwEBQr8oCaMEsl5zwcVLsWS80aqlFa4/LHU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=cuirGiXoxsE7CoEeWNdM8I0nOsgS/f9dY7DjUYzIG9/tmlf08YAQ7L2o2XPH70sxc
         wLTtu9HxL3mOTIhFw+PiF96DrqVUL406WEZs2A/sybjhh+1DpafOH6lChB0KzpfMrL
         iF9a1VE7hQ5BjulUyx/5YNty4YQ6PrdEzjG/HWCzI/j6zRl84i8+7fkRiywFDLi6wp
         DiPIQ63uPWqfRxwBc7GdST6olellaoHrsOQOuM+jaOkoxd/diUvcoNAEj3qLcRzYHv
         0RqdtqChsNV6gp90d9gOSFU5EdyqTJ3R84KfVCuMDAYwEfZ1dkDI8CWmRRFAaJrH0L
         US23oQrtbBviw==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201116075532.4019252-2-m.tretter@pengutronix.de>
References: <20201116075532.4019252-1-m.tretter@pengutronix.de> <20201116075532.4019252-2-m.tretter@pengutronix.de>
Subject: Re: [PATCH 01/12] ARM: dts: define indexes for output clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     rajanv@xilinx.com, tejasp@xilinx.com, dshah@xilinx.com,
        rvisaval@xilinx.com, michals@xilinx.com, kernel@pengutronix.de,
        robh+dt@kernel.org, mturquette@baylibre.com,
        Michael Tretter <m.tretter@pengutronix.de>
To:     Michael Tretter <m.tretter@pengutronix.de>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
Date:   Sat, 12 Dec 2020 21:44:04 -0800
Message-ID: <160783824459.1580929.13304747352812344302@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Tretter (2020-11-15 23:55:21)
> The VCU System-Level Control has 4 output clocks. Define indexes for
> these clocks to allow to reference them in the device tree.
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
