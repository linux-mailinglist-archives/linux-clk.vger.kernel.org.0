Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F112D1F76AF
	for <lists+linux-clk@lfdr.de>; Fri, 12 Jun 2020 12:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbgFLKXr (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 12 Jun 2020 06:23:47 -0400
Received: from sonic310-57.consmr.mail.ir2.yahoo.com ([77.238.177.30]:43463
        "EHLO sonic310-57.consmr.mail.ir2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726314AbgFLKXZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Jun 2020 06:23:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1591957403; bh=CPKiRa5U3AsWGiQa1t3nAdN7bYjYuC6JbDJgbXJA0WA=; h=Date:From:Reply-To:Subject:References:From:Subject; b=bRuJVyA5Nmin4ukoL8Cz4Tyy7VkSCLkElwHOEyLEpl+vVolZRDImDZJkbKccXQSoPzpH1WVJ2qckiPBjh+Ng5fZRvBsB/8MSJ+fwVR1OCDKOkqH/7gK+c67CoFposc08k7TTnilUXKCrj9vnmtqHMoxnaLdfsGIeYcDu3e0lZpGtTjUXT3TxLbeBf3cVu/UoLwi9j3T8617f17pn+gqYZc1UptwBDS6yc08XhbdWMnG63XU7QFSp8Y630sfOpvbSCHyidmC4OCNPx7SIWb5rdrEFu4hTiogTFHuLJ/vV4FShb6JS4+fb7AHFM8hRV/+A+rHQ+HQqZTUx3mw+k81RRw==
X-YMail-OSG: eFd7kloVM1lmZ6bMEVPRFfjUKj.lUFE3BfnZtqhTrP2d8AJanW2676UH3bhZfom
 Wc5eXTbOIBpDEyp33xMRx9GciR65zxtjFuQQ211oOaor1YttJW3BRIbPVf.Dbk8kRrSGjE6hFAum
 RNhD6j1tVhMkcJdyNr2jCNbUnqmMQcvbVIkH70GaF7cacxsM77cTTpmPr3NsTn6BmBnyKRDkOcxF
 GzEQgm1JfqoZcRhDQK.IaD5am0eW139Uu8LY4FJ41tmQ.P6vDViKWHnw_xQYJLNwvGEWko.Fj3SA
 ce6juCdboPavd6eKUb0vxJ1SDLJg0mAWsMJNcaQw8rlvArq19vNaSa4tFVSlg373tdOAJwz6Jpjq
 8n5JykG7a2.p0f.b7DgJZ8iP9t_0jX3D0FBcCvCDI_XeYkqa.nhRlpg_hRAJGp277PBYLGBwuaB9
 UepW4JV7XNDoV6s7cLjKp1AEoNdwShhbcFTKyuUINlRmXm1siABCO48T6xLKkJsrhGYBibxPyf8H
 RgX4QR5Q4fcONLO6HCDiZb7e2flVYfuS9huMcmYvxDyZXUTGcZ_9MigXWytSLZlxmYQUZUDuSoLI
 YJZ2dkGrDLgqP8pHrZbzXQWvKAnPrPKHEdSyBtcqe4keigPoh35yJagpstvWBWnDu.QgcUM4LVrF
 19ziIsU4oIw7mdDgZmmQlFFdRWmIJOZdlU7zCTQG_Ks6chSkNCBLY7t0uaMGY_Ta_1SdL_5zJrKy
 nP6S0uwC1eGzjUaY_8P4H2QqRHQ0XOrFwxvRz3_Pbx9vUWIHo78TfiEzq92IhfUOBWfJLE187oaP
 VBH9nbWwhhvHCxyySATK_ntPDFN3PxjeC9wYiEOkRlgcWP9kgxuCLxf4lfhLzF2.H0_VlJiqIzPW
 u5Tx3uNnB442OXXEu71LJxzzYVR8AXs19xo_RB7BSCWHIvg57_ykrLbeoi_vtEDk7aeN.JsJ_1.Q
 XMF4xCWGjQ6dtfZPfG.7SEXhNI5g9LHtkRTe5iuwhNU0CdlzUp8M9hcgZ_8lRtMN0EEVsHibyqr9
 J5TSxxlQaaMwxV5Tfbfug.KfPKdvCSBHKMrRsvLCDt96lzvhfPQ56QRDPERSMe7YRD5zV1TVholS
 dJx.5WQLqAwt2GRuAzGLgNrDM84wbRMMgluvdro1mNxNEr0A6jdF102cHtcn0c0FE.MQgPhqY2A9
 _HfQb63oFKJpIVQqkVUWaoE95My1UUm5YUbIAqDpmdfKtwMsNzB7h5NX_1kZbPId3oJIIdKIsVbx
 d.75OCajvRBtxLSOC3J_0uWmnT_LUN9TMXQj9Blej4D1tLpQSZG.1e.LqzUAL1_ET3uyHNQdsrA-
 -
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.ir2.yahoo.com with HTTP; Fri, 12 Jun 2020 10:23:23 +0000
Date:   Fri, 12 Jun 2020 10:23:21 +0000 (UTC)
From:   "Mrs. Anna H. Bruun" <mrs.kishmichael1@gmail.com>
Reply-To: mrsannabruun111@gmail.com
Message-ID: <1055471108.3699071.1591957401245@mail.yahoo.com>
Subject: GOOD DAY
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1055471108.3699071.1591957401245.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16072 YMailNodin Mozilla/5.0 (Windows NT 6.1; rv:77.0) Gecko/20100101 Firefox/77.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Dear,

Am Mrs. Anna H. Bruun I know that this message will be a surprise to you. Firstly, I am married to Mr. Patrick Bruun, A gold merchant who owns a small gold mine in Burkina Faso; He died of Cardiovascular Disease in mid-March 2011. During his lifetime, he deposited the sum of Eight million, Five hundred thousand Euros. in a bank in Ouagadougou the capital city of Burkina Faso in West Africa. The deposited money was from the sale of the shares, death benefits payment and entitlements of my deceased husband by his company.

I am sending this message to you praying that it will reach you in good health since I am not in good health condition in which I sleep every night without knowing if I may be alive to see the next day. I am suffering from long time cancer and presently I am partially suffering from a stroke illness which has become almost impossible for me to move around. I need your urgent answer to know if you will be able to execute this project, and I will give you more information on how the fund will be transferred to your bank account.

Thanks
Mrs. Anna H.
