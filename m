Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE4702032FD
	for <lists+linux-clk@lfdr.de>; Mon, 22 Jun 2020 11:11:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgFVJLL (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 22 Jun 2020 05:11:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:44698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726461AbgFVJLK (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 22 Jun 2020 05:11:10 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 54CE4206D7;
        Mon, 22 Jun 2020 09:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592817070;
        bh=XHEAm1XCUcU0Y541Al++PNKo3s1W8HKmzZkB9eV3fRs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=OsWFc5e/Tn6FVpkw/tqVu2cpElX32mleWOidHcca9m+l3/7rHauUFpSn3OCCk1Qrc
         +/pjPBt1sD6aumAmjvhO2uw3sGuDm6K9oDerrGdpsCrKPhmJTYwbaA1n5yXLe24mr4
         fui6DYE3gArwzLckc9hHB+TYNC83EHOrsWqR/0J4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200611021941.786-2-sarangmairal@gmail.com>
References: <20200610151744.35478-1-sarangmairal@gmail.com> <20200611021941.786-1-sarangmairal@gmail.com> <20200611021941.786-2-sarangmairal@gmail.com>
Subject: Re: [PATCH v2] clk: add function documentation for clk_hw_round_rate()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Sarang Mairal <sarangmairal@gmail.com>
To:     Sarang Mairal <sarangmairal@gmail.com>, linux-clk@vger.kernel.org,
        mturquette@baylibre.com
Date:   Mon, 22 Jun 2020 02:11:09 -0700
Message-ID: <159281706955.62212.13116326715188984737@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Sarang Mairal (2020-06-10 19:19:41)
> Information about usage and prerequisites for this API.
>=20
> Signed-off-by: Sarang Mairal <sarangmairal@gmail.com>
> ---

Applied to clk-next
