Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A23F231941F
	for <lists+linux-clk@lfdr.de>; Thu, 11 Feb 2021 21:18:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbhBKURu (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 11 Feb 2021 15:17:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:45168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230144AbhBKURi (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Feb 2021 15:17:38 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 081EF64DBA;
        Thu, 11 Feb 2021 20:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613074618;
        bh=ynLIewiFqPy3fzWSxN01PcYzwGpgfJteJiQEG4pnLWs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=iGg8jdHtRo7IVtuhCaAWWQbT82lk85RgkJE10xKlr6fWiOdeXX7RnZJXu4Bgm8/P3
         XMfmR7AyIQJ168SQxO1wV2BzPJs5EmDhHuGdIqUoTG04W3spZACfVN8ZM/ZyXFjnSI
         jF4OvHg1i99Mp3s5uRz21RHR+50tr095SkVNfQd91u8D5YE4nauTiFhHT04R0WDHuY
         4Yo1z1xaay3F9gaM9eb929Pi7kSzpsz0IEUQ28fbA0NqscPisXCC2iJBFrglwn+bPZ
         sVsouI5kUNVh9BO9htjMoN9+Ef+UmJTw/HS7KWZ++ZlH0NJqCdLD6PPxo3cS4HAhMi
         K6HIAOtIOwvNg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1612496104-3437-2-git-send-email-saeed.nowshadi@xilinx.com>
References: <1612496104-3437-1-git-send-email-saeed.nowshadi@xilinx.com> <1612496104-3437-2-git-send-email-saeed.nowshadi@xilinx.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: si570: Add 'silabs,skip-recall' property
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, robh+dt@kernel.org, git-dev@xilinx.com,
        Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>
To:     Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Date:   Thu, 11 Feb 2021 12:16:56 -0800
Message-ID: <161307461661.1254594.6774037673480167095@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Saeed Nowshadi (2021-02-04 19:35:03)
> Add an optional property so the driver can skip calling the NVM->RAM
> recall operation during probe().
>=20
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> ---

Applied to clk-next
