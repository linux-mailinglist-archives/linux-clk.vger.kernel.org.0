Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDB6F2B30E5
	for <lists+linux-clk@lfdr.de>; Sat, 14 Nov 2020 22:04:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726172AbgKNVD4 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 14 Nov 2020 16:03:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:37132 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726140AbgKNVDz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 14 Nov 2020 16:03:55 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6FC8C20A8B;
        Sat, 14 Nov 2020 21:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605387835;
        bh=IPG9cK6wG+FANwXrrS4b1vVrKoyrmiwa9arq9y8TAuM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ga2yr1exN3Vix+cAR+Q0sxlketSNgkTweumvE7D09nhp7EgTqpDUgrNjhvObEw6xP
         cMYJT2vAhzB7rVTFOfZBJaRj303svmfIIWMzNvKKlKpVfvdzd6hDZOKh8deUkHR6z8
         95VCKHfHw5uoqGQbCZ2qWFA53Q2wGSDLajXEnCOk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201109233622.23598-1-khilman@baylibre.com>
References: <20201109233622.23598-1-khilman@baylibre.com>
Subject: Re: [PATCH] clk: meson: enable building as modules
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
To:     =?utf-8?q?J=C3=A9r=C3=B4me?= Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org
Date:   Sat, 14 Nov 2020 13:03:54 -0800
Message-ID: <160538783425.60232.7165875065149441256@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Kevin Hilman (2020-11-09 15:36:22)
> Make it possible to build all clk drivers as modules, but default
> remains built-in.
>=20
> No functional changes.
>=20
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
