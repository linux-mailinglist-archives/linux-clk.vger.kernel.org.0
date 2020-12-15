Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB3182DB452
	for <lists+linux-clk@lfdr.de>; Tue, 15 Dec 2020 20:12:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731252AbgLOTLI (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 15 Dec 2020 14:11:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:56684 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731813AbgLOTK5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 15 Dec 2020 14:10:57 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608059416;
        bh=08j5OFmhFrBxQpYjYcINPCo8BIUzpe98ZwKfkBs/CYI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=iCfai7ARBGrUkLWj33cBTcA6lcuobxURhLv++fsmgyTXikXSBEZO/3T5Qc6f+H6c8
         iL9OOCjkS3i3HL/9SXHcLS52gkAT7vJcXh95oe0Oek5ZMlevSA9gKmDPh30PN3Ee7/
         7ljaydsQiBDdAoD36CoEEBm3wcGabmfYYO0yHd8nVpvDuZTRVBmO3i5pLyLrbtoaDE
         o8qr25vZwfckPvkdqC7zLk1KVyewHg0MCWnyODk1B0ye6EK9bYD9glOq2DZ3Imswo3
         lD/WcCgBuLnJUiFmDqPh2aYM7zO9uLtFfWEo1E7SmlYAkHDL8pme5xnuKTGJOMwz8n
         UNM9ffh0qGE9Q==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a62e0871-d6bd-d233-fdea-014ba638e782@xilinx.com>
References: <1604502407-14352-1-git-send-email-shubhrajyoti.datta@xilinx.com> <a62e0871-d6bd-d233-fdea-014ba638e782@xilinx.com>
Subject: Re: [PATCH v7 0/7] clk: clk-wizard: clock-wizard: Driver updates
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     git@xilinx.com, devicetree@vger.kernel.org,
        mturquette@baylibre.com, gregkh@linuxfoundation.org,
        devel@driverdev.osuosl.org
To:     Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-clk@vger.kernel.org
Date:   Tue, 15 Dec 2020 11:10:15 -0800
Message-ID: <160805941555.1580929.8450497692646172781@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michal Simek (2020-12-15 01:13:46)
>=20
> Can you please take a look at this series?
>=20

I did, see https://lore.kernel.org/r/160783777786.1580929.19508261066273976=
16@swboyd.mtv.corp.google.com
