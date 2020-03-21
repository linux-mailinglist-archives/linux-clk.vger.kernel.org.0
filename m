Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E9F618DC64
	for <lists+linux-clk@lfdr.de>; Sat, 21 Mar 2020 01:12:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726773AbgCUAMy (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 20 Mar 2020 20:12:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:51492 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726738AbgCUAMy (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 20 Mar 2020 20:12:54 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DB4C720753;
        Sat, 21 Mar 2020 00:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584749574;
        bh=DnhPbWzQwKroX7nBdWFxqbUk1n4HZdjpIAK0tlR+kEE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=zqlaoCwA7nXfDw2SkB5hDp8OKPJrAZhKd24EIaj+OQSkQlsRTFf5bUg5iiy8ZQK/z
         iRlUu3zDT0SXHzg3b30OW/dCW6uoczGfroRGm0TjnpMHy9LieEaPmntBfSHNtul0pe
         bNJ1bErDB5xTkplAI8S+Sl9T1ITaLDsVcIJX2WYE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200310135507.87959-1-andriy.shevchenko@linux.intel.com>
References: <20200310135507.87959-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1] clk: Fix trivia typo in comment exlusive => exclusive
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Date:   Fri, 20 Mar 2020 17:12:53 -0700
Message-ID: <158474957303.125146.849596024736449322@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Andy Shevchenko (2020-03-10 06:55:07)
> Fix trivia typo in comment exlusive =3D> exclusive.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Applied to clk-next
