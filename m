Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E42D93B57A8
	for <lists+linux-clk@lfdr.de>; Mon, 28 Jun 2021 05:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232069AbhF1DF0 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 27 Jun 2021 23:05:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:60654 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231972AbhF1DFZ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 27 Jun 2021 23:05:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F257E61988;
        Mon, 28 Jun 2021 03:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624849381;
        bh=jl2Jzg4pPBCbo9r7BWs4O3I1IiWZSlLg4lJYRXJK1V8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=iYJnem+A3kPwmFE3otjFRZxfkhP8Br/K20Fj5Umkfrk/6ixIxk2T5ie1AlOl9H7TF
         bZaoiDX0hMkkXFelYwJotvsiH1iMzq3ydGUI0bHZLZlbty3rzda50L7EmHE92U39Ca
         Qmpe/YGpRR8jD65wS9vkJX0RJ/6WKqpug0SxJJPkoox1Qotmqu97/xi+FKazDDmIpW
         KjCLoj9ptQ//T3H743oLuEvQSFL9YxlW9LOuU48ehVcyz9ltH1eS8p+8w1Zl2ErTRV
         +GU1oF09YlP4mbd0EzgtGGkQtHytfXr8JjeaWMPNgfVex0tp3dUG+VK+3J6sSjkOmh
         iqp7/oZ2QW4ow==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210325192643.2190069-9-robert.hancock@calian.com>
References: <20210325192643.2190069-1-robert.hancock@calian.com> <20210325192643.2190069-9-robert.hancock@calian.com>
Subject: Re: [PATCH v3 8/9] clk: si5341: Add silabs,iovdd-33 property
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mike.looijmans@topic.nl, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
To:     Robert Hancock <robert.hancock@calian.com>, mturquette@baylibre.com
Date:   Sun, 27 Jun 2021 20:02:59 -0700
Message-ID: <162484937982.2516444.7958494723652405474@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Robert Hancock (2021-03-25 12:26:42)
> Add a property to allow specifying that the external I2C IO pins are using
> 3.3V voltage thresholds rather than 1.8V.
>=20
> Signed-off-by: Robert Hancock <robert.hancock@calian.com>
> ---

Applied to clk-next
