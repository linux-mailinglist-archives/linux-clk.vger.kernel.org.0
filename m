Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C126263F1C
	for <lists+linux-clk@lfdr.de>; Thu, 10 Sep 2020 09:54:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730270AbgIJHyB (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 10 Sep 2020 03:54:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:34384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726746AbgIJHxv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 10 Sep 2020 03:53:51 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D0FA120809;
        Thu, 10 Sep 2020 07:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599724431;
        bh=n1QBIsVMDUh2m/zhVn8mDBCWWV4HT41M1NSn+x9O4/k=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=OxHoQQYi0q8l5JFZdwT8LxF7uoGZgi9tb5P8jev3yUfK0jvuu56v1HZT6bafbLQ0t
         VOs+maEHa/DI79jzqq3XLVQSOSh9axwUBFSSeC6KX/2HLv4srtXZ+siU6XR61aKqP1
         ESYUQJW39awTHEEcIjGiA4aUuPrPjKB/m+sjcMDc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200903082636.3844629-1-maxime@cerno.tech>
References: <20200903082636.3844629-1-maxime@cerno.tech>
Subject: Re: [PATCH] clk: bcm: dvp: Select the reset framework
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Maxime Ripard <maxime@cerno.tech>
To:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Date:   Thu, 10 Sep 2020 00:53:49 -0700
Message-ID: <159972442943.2295844.14502206270556756528@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2020-09-03 01:26:36)
> The DVP driver depends both on the RESET_SIMPLE driver but also on the
> reset framework itself. Let's make sure we have it enabled.
>=20
> Fixes: 1bc95972715a ("clk: bcm: Add BCM2711 DVP driver")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Applied to clk-fixes
