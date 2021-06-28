Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69AFB3B57A6
	for <lists+linux-clk@lfdr.de>; Mon, 28 Jun 2021 05:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232033AbhF1DFU (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 27 Jun 2021 23:05:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:60618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231972AbhF1DFU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 27 Jun 2021 23:05:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 643C661988;
        Mon, 28 Jun 2021 03:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624849375;
        bh=SGeJe0YhXE2Pg1cOJgyUtSoOGBewETfefyC3bGv9VTw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=fHDyNqmfMSqd9UW3uOiw7ubHqQFblsNCWVpWDSb7DVEnLM5XYiobtJOI5BPwVp20d
         PVkEVHCYZlTUgTfkmUfC55/3UD3/ep3J0zQsxbP0bedfQ7KR9rhK/X4PNF5S3CavlB
         dAqcorox1VuksVJNe2CF0imYV+U3qNyXfVJUjQT/Qsb5uz6PnWloYJFFoQ6xHxMW3/
         5nq2q/1+op7mAMJettgkZe5AG8/MERmPX9JHcNMWl2RqQXH99iQbV7c+guFz+XBynC
         2EIEoX/ZEukHKWEZom7PxFaZIqUxkZOxXGRKOdQDjBeQ9n88mjV6jVmerlrHngJwAk
         Mrk/wDXUx5ZiA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210325192643.2190069-8-robert.hancock@calian.com>
References: <20210325192643.2190069-1-robert.hancock@calian.com> <20210325192643.2190069-8-robert.hancock@calian.com>
Subject: Re: [PATCH v3 7/9] clk: si5341: Add silabs,xaxb-ext-clk property
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mike.looijmans@topic.nl, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
To:     Robert Hancock <robert.hancock@calian.com>, mturquette@baylibre.com
Date:   Sun, 27 Jun 2021 20:02:54 -0700
Message-ID: <162484937422.2516444.983627342157163703@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Robert Hancock (2021-03-25 12:26:41)
> Add a property to allow specifying that the device XA/XB pins are used for
> an external clock input rather than for a clock crystal.
>=20
> Signed-off-by: Robert Hancock <robert.hancock@calian.com>
> ---

Applied to clk-next
