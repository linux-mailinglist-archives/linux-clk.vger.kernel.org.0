Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DFC53B57AA
	for <lists+linux-clk@lfdr.de>; Mon, 28 Jun 2021 05:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232056AbhF1DFd (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 27 Jun 2021 23:05:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:60700 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231972AbhF1DFd (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 27 Jun 2021 23:05:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A52B861C2A;
        Mon, 28 Jun 2021 03:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624849388;
        bh=vlJ8rFgj2K0F4FN/H+kFMlM636SGMGFex+axzKuap7Q=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=FzeHOm5LlLdgjOsr0Ho6Zwe3o4sFNtgUhuvQilFVqxuTOm7CjYHscJoNad9jtS+4H
         a7ZknD9ltU7NKvMLU5y8BOlaOqkzHtdt/t79wf5Kg+Kxo9TTJJSv7fbCFho6a8l6t2
         04Cjp2LQDfyJj13z5EH9y+sI1GiX+1MZBXD1M1V/F2p55VgqLnlqF17YUS2Q+7COg9
         64cyARAl4DPShSYYz/AsisYDF9DUfJxMzqxOTGdUhLDk0p6kwY3chZwKmZNxUuy2dx
         OdW1641hg9Jf0dwjJLpstIW07QJv5kth3pUfVlqLlRxEq7R4L+liogmQIWFlbPW2qp
         R3ItXYAOxlPzg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210325192643.2190069-10-robert.hancock@calian.com>
References: <20210325192643.2190069-1-robert.hancock@calian.com> <20210325192643.2190069-10-robert.hancock@calian.com>
Subject: Re: [PATCH v3 9/9] clk: si5341: Add sysfs properties to allow checking/resetting device faults
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mike.looijmans@topic.nl, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
To:     Robert Hancock <robert.hancock@calian.com>, mturquette@baylibre.com
Date:   Sun, 27 Jun 2021 20:03:06 -0700
Message-ID: <162484938670.2516444.3250234704965665415@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Robert Hancock (2021-03-25 12:26:43)
> Add sysfs property files to allow viewing the current and latched states =
of
> the input present and PLL lock bits, and allow resetting the latched fault
> state. This allows manual checks or automated userspace polling for faults
> occurring after initialization.
>=20
> Signed-off-by: Robert Hancock <robert.hancock@calian.com>
> ---

Applied to clk-next
