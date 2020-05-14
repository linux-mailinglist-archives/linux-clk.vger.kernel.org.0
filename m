Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6D181D3F63
	for <lists+linux-clk@lfdr.de>; Thu, 14 May 2020 22:56:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727975AbgENU4A (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 14 May 2020 16:56:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:39724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726200AbgENUz7 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 14 May 2020 16:55:59 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5A608207E8;
        Thu, 14 May 2020 20:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589489759;
        bh=9IxKQdyP8dC+y4xB/GzFEZ66AXNCoV9tM8PP7KQgFBc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=bDQ9LQYHSL4OSfP/pGMSUpfLmgjQ4a2loCpQHclgYby3Y6onnjVJPd82pe41tU5oT
         GGhrMn6QVGPbENeozyUDGvqtrAkDlfpinygn2rJKrNWWs+zsRS6EaaoE/IldnMCDM4
         51oPm2miwoOmX7jfzlVg3yEDLsC2nv54X5SrXrfU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1j3686g6r6.fsf@starbuckisacylon.baylibre.com>
References: <1j3686g6r6.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: updates for v5.8
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org
To:     Jerome Brunet <jbrunet@baylibre.com>
Date:   Thu, 14 May 2020 13:55:58 -0700
Message-ID: <158948975864.215346.6720030658125416749@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2020-05-11 02:28:45)
> Hi Stephen,
>=20
> Here are the amlogic clock updates for v5.8.
> Nothing fancy, please pull.
>=20
> Cheers
>=20
> The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f31=
36:
>=20
>   Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.8-1
>=20
> for you to fetch changes up to a29ae8600d50ece1856b062a39ed296b8b952259:
>=20
>   clk: meson: meson8b: Don't rely on u-boot to init all GP_PLL registers =
(2020-05-02 01:53:32 +0200)
>=20
> ----------------------------------------------------------------
> Amlogic clock updates for v5.8:
>=20
> * Meson8b: Updates and fixup HDMI and video clocks
> * Meson8b: Fixup reset polarity
> * Meson gx and g12: fix GPU glitch free mux switch
>=20
> ----------------------------------------------------------------

Should also mention that sparse on arm64 complains about=20

drivers/clk/meson/g12a.c:5074:43: warning: invalid access past the end of '=
g12b_hw_onecell_data' (1472 8)

but I have no idea if that's a real problem. Maybe my sparse build is
bad?
